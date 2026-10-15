{ pkgs, ... }:
let
  # Must live in a directory knot-resolver can read; its watchdog reloads the
  # RPZ whenever this file is replaced.
  blocklist = "/var/lib/knot-resolver/oisd-big.rpz";

  # knot-resolver refuses to start if the RPZ file is missing, and the real
  # list can't be downloaded until DNS works, so seed an empty zone first.
  emptyRpz = pkgs.writeText "empty.rpz" ''
    $TTL 300
    @ SOA localhost. root.localhost. 1 3600 600 86400 300
      NS  localhost.
  '';

  tailnet = "taild0377a.ts.net";

  quad9 = {
    address = [
      "9.9.9.9"
      "149.112.112.112"
      "2620:fe::fe"
      "2620:fe::9"
    ];
    transport = "tls";
    hostname = "dns.quad9.net";
  };
in
{
  # Knot Resolver 6 is the system resolver: it recurses from the root itself
  # (DNSSEC-validating by default), and only forwards to Quad9 over TLS when
  # it can't reach a domain's nameservers. Listens on 127.0.0.1:53 and ::1:53.
  services.knot-resolver = {
    enable = true;
    settings = {
      cache.size-max = "100M";
      local-data.rpz = [ { file = blocklist; } ];
      # MagicDNS names, since Tailscale no longer configures DNS on this host
      # (see services.tailscale below). Its answers aren't DNSSEC-signed.
      forward = [
        {
          subtree = tailnet;
          servers = [ "100.100.100.100" ];
          options.dnssec = false;
        }
      ];
      fallback = {
        enable = true;
        servers = [ quad9 ];
      };
    };
  };

  systemd.services.knot-resolver.preStart = ''
    [ -e ${blocklist} ] || install -m 0644 ${emptyRpz} ${blocklist}
  '';

  #Periodically fetch the oisd big blocklist; knot-resolver picks it up on its own.
  systemd.services.knot-resolver-update-blocklist = {
    description = "Download oisd big blocklist for knot-resolver";
    after = [
      "network-online.target"
      "knot-resolver.service"
    ];
    wants = [ "network-online.target" ];
    serviceConfig = {
      Type = "oneshot";
      User = "knot-resolver";
      Group = "knot-resolver";
    };
    # Download beside the target and rename, so the watchdog never sees a partial file.
    script = ''
      ${pkgs.curl}/bin/curl -fsSL -o ${blocklist}.tmp https://big.oisd.nl/rpz
      mv -f ${blocklist}.tmp ${blocklist}
    '';
  };

  systemd.timers.knot-resolver-update-blocklist = {
    description = "Update oisd big blocklist daily";
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "daily";
      Persistent = true;
      RandomizedDelaySec = "1h";
    };
  };

  # The tailnet has "Override local DNS" on, which makes Tailscale claim all
  # lookups (~.) on tailscale0 and bypass knot-resolver. Opt this host out;
  # MagicDNS keeps working through the forward rule above.
  services.tailscale.extraSetFlags = [ "--accept-dns=false" ];

  # resolved stays as the stub on 127.0.0.53 (NSS, per-link DNS)
  # but sends everything to knot-resolver. DNSSEC and TLS happen there, so
  # neither is needed on the loopback hop.
  services.resolved = {
    enable = true;
    settings.Resolve = {
      DNS = [
        "127.0.0.1"
        "::1"
      ];
      Domains = [ "~." ];
      DNSSEC = "false";
      DNSOverTLS = "no";
      # Don't let resolved quietly bypass knot-resolver with its built-in list.
      FallbackDNS = [ ];
    };
  };
}

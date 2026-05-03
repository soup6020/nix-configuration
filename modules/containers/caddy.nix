# Caddy as a host-level NixOS service.
{ ... }:
let
  domain = "soup6020.dev";

  # Plain reverse-proxy vhosts to upstreams that listen on loopback or LAN.
  proxies = {
    "jellyfin" = "http://127.0.0.1:8096";
    "pw" = "http://127.0.0.1:8000"; # vaultwarden
    "bt" = "http://127.0.0.1:9091"; # transmission
    "books" = "http://127.0.0.1:8083"; # calibre-web
    "mc" = "http://192.168.1.162:8089";
    "mc2" = "http://192.168.1.162:8100";
  };

  # Upstreams that present self-signed / invalid certs — skip TLS verify.
  insecureProxies = {
    "pf" = "https://192.168.1.1:8443"; # OPNSense
    "photoprism" = "https://127.0.0.1:2342";
  };

  mkProxy = name: upstream: {
    hostName = "${name}.${domain}";
    extraConfig = ''
      reverse_proxy ${upstream}
    '';
  };

  mkInsecureProxy = name: upstream: {
    hostName = "${name}.${domain}";
    extraConfig = ''
      reverse_proxy ${upstream} {
        transport http {
          tls_insecure_skip_verify
        }
      }
    '';
  };
in
{
  services.caddy = {
    enable = true;
    email = "ecallaghan@protonmail.com";

    virtualHosts =
      builtins.mapAttrs mkProxy proxies
      // builtins.mapAttrs mkInsecureProxy insecureProxies
      // {
        # Serve glance on domain apex.
        "${domain}" = {
          extraConfig = ''
            reverse_proxy http://127.0.0.1:8080
          '';
        };

        # Static file browser.
        "nx.${domain}" = {
          extraConfig = ''
            root * /srv/nx
            file_server browse
          '';
        };
      };
  };
}

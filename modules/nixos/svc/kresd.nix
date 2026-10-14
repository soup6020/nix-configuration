{
  pkgs,
  ...
}:
let
  blocklist = "/var/lib/kresd/oisd-big.rpz";
in
{
  services.kresd = {
    enable = true;

    #Listen only on loopback; DNSSEC is enabled by default.
    listenPlain = [
      "[::1]:53"
      "127.0.0.1:53"
    ];

    extraConfig = ''
      -- Cache (100MB)
      cache.size = 100 * MB

      -- Load the oisd big blocklist as an RPZ zone (if downloaded)
      local rpz_file = '${blocklist}'
      if io.open(rpz_file, 'r') then
        policy.add(policy.rpz(policy.DENY, rpz_file))
      end
    '';
  };

  #Periodically fetch the oisd big blocklist and reload kresd.
  systemd.services.kresd-update-blocklist = {
    description = "Download oisd big blocklist for kresd";
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.curl}/bin/curl -fsSL -o ${blocklist} https://big.oisd.nl/rpz";
      ExecStartPost = "${pkgs.systemd}/bin/systemctl restart kresd@1.service";
    };
  };

  systemd.timers.kresd-update-blocklist = {
    description = "Update oisd big blocklist daily";
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "daily";
      Persistent = true;
      RandomizedDelaySec = "1h";
    };
  };
}

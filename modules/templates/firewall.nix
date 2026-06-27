{
  #Basic nftables firewall, add or remove interfaces and ports as needed
  networking.nftables.enable = true;
  networking.firewall = {
    enable = true;
    trustedInterfaces = [
      "lo"
      "podman0"
    ];
    logRefusedConnections = true; # spams the hell out of dmesg if true
    logRefusedUnicastsOnly = true; # spams less if enabled with above
    checkReversePath = false; # workaround for Docker
    logReversePathDrops = false; # also spams dmesg

    allowedTCPPorts = [
      22 # ssh
      34758 # tailscale
      65142 # amnezia
    ];

    allowedUDPPorts = [

    ];

    allowedUDPPortRanges = [
      {
        from = 60000; # mosh
        to = 61000;
      }
    ];
  };
}

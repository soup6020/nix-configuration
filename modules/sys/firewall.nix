{
  networking.nftables.enable = true;
  networking.firewall = {
    enable = true;
    trustedInterfaces = [ "lo" ];
    checkReversePath = false; #workaround for Docker
    allowedTCPPorts = [
      22 # ssh
      53 # dns
      80 # http
      111 # rpcbind (NFS)
      443 # https
      631 # cups
      2049 # NFS
      2234 # slsk
      3074 # bo3
      4001 # lockd (NFS)
      4002 # mountd (NFS)
      4000 #statd (NFS)
      6600 # mpd
      7777 # terraria
      19131 # bedrock
      25565 # minecraft
      27017 # bo3
      32400 # plex
      32469 # plex dlna
      34758 # tailscale
      51413 # transmission
      65142 # amnezia
    ];
    allowedUDPPorts = [
      111 # rpcbind (NFS)
      2049 # NFS
      3074 # bo3
      4001 # lockd (NFS)
      4002 # mountd (NFS)
      4000 #statd (NFS)
      7777 # terraria
      19132 # bedrock
      27015 # srcds
      27017 # bo3
      51413 # transmission
    ];
    allowedUDPPortRanges = [
      {
        from = 60000; # mosh
        to = 61000;
      }
    ];
  };
}

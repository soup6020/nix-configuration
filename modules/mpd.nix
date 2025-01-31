{
  services.mpd = {
    enable = true;
    musicDirectory = "/mnt/cold/Media/Music";
    user = "ezra";
    extraConfig = ''
      # must specify one or more outputs in order to play audio!
      # (e.g. ALSA, PulseAudio, PipeWire), see next sections
    '';

    # Optional:
    network.listenAddress = "any"; # if you want to allow non-localhost connections
    network.startWhenNeeded = true; # systemd feature: only start MPD service upon connection to its socket
  };
}

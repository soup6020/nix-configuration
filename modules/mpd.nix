{
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    extraConfig.pipewire.adjust-sample-rate = {
      "context.properties" = {
        "default.clock.rate" = 192000;
        "default.allowed-rates" = [ 192000 ];
      };
    };
  };
  services.mpd = {
    enable = true;
    musicDirectory = "/mnt/cold/Media/Music";
    user = "ezra";
    extraConfig = ''
        audio_output {
        type "pipewire"
        name "PipeWire Output"
      }
    '';

    network.listenAddress = "any"; # if you want to allow non-localhost connections
    network.startWhenNeeded = true; # systemd feature: only start MPD service upon connection to its socket
  };
  systemd.services.mpd.environment = {
    XDG_RUNTIME_DIR = "/run/user/1000"; # hardcoded and ugly, should fix later
  };
}

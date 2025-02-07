{
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
  };
  systemd.services.mpd.environment = {
    XDG_RUNTIME_DIR = "/run/user/1000"; # hardcoded and ugly, should fix later
  };
}

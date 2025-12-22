{
  config,
  lib,
  inputs,
  ...
}:
{
  services.mpd = {
    enable = true;
    settings.music_directory = "/mnt/cold/Media/Music";
    user = "ezra";
    settings = {
      audio_output = [
        {
          type = "pipewire";
          name = "PipeWire Output";
        }
        {
          type = "fifo";
          name = "ncmpcpp_fifo";
          path = "/tmp/mpd.fifo";
          format = "44100:16:2";
        }
      ];
    };
    settings.bind_to_address = "any"; # if you want to allow non-localhost connections
    openFirewall = true;
  };
  systemd.services.mpd.environment = {
    XDG_RUNTIME_DIR = "/run/user/1000"; # hardcoded and ugly, should fix later
  };
  services.mpdscribble = {
    enable = true;
    endpoints = {
      "last.fm" = {
        passwordFile = config.age.secrets.mpdscribble.path;
        username = "soup6020";
      };
    };
  };
}

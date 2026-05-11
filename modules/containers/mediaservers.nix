{ config, ... }:
{
  virtualisation.quadlet.containers.plex = {
    autoStart = true;
    containerConfig = {
      image = "lscr.io/linuxserver/plex:latest";
      networks = [ "host" ];
      volumes = [
        "/var/lib/containers/storage/volumes/plex/config:/config"
        "/mnt/cold/Media/TV:/TV"
        "/mnt/cold/Media/Movies:/Movies"
        "/mnt/cold/Media/Anime:/Anime"
        "/mnt/cold/Media/Anime Movies:/AniMovies"
        "/mnt/cold/Media/Music:/Music"
        "/mnt/cold/backups/old-hdd/Movies:/OldMovies"
        "/mnt/cold/backups/old-hdd/TV:/OldTV"
      ];
      devices = [ "/dev/dri:/dev/dri" ];
      environmentFiles = [ config.age.secrets."plex-env".path ];
    };
    serviceConfig.Restart = "always";
  };

  virtualisation.quadlet.containers.jellyfin = {
    autoStart = true;
    containerConfig = {
      image = "docker.io/jellyfin/jellyfin:latest";
      networks = [ "host" ];
      volumes = [
        "/var/lib/containers/storage/volumes/jellyfin/config:/config"
        "/var/lib/containers/storage/volumes/jellyfin/cache:/cache"
        "/mnt/cold/Media/TV:/TV"
        "/mnt/cold/Media/Movies:/Movies"
        "/mnt/cold/Media/Anime:/Anime"
        "/mnt/cold/Media/Anime Movies:/AniMovies"
        "/mnt/cold/Media/Music:/Music"
      ];
      # video (group 27) and render (group 303) for VAAPI.
      addGroups = [
        "27"
        "303"
      ];
      devices = [ "/dev/dri:/dev/dri" ];
      environments = {
        JELLYFIN_PublishedServerUrl = "https://jellyfin.soup6020.dev";
      };
    };
    serviceConfig.Restart = "always";
  };
}

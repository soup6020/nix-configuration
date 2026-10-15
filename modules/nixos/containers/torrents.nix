{ config, ... }:
{
  age.secrets."transmission-env".file = ../../../secrets/transmission-env.age;

  virtualisation.quadlet.containers.transmission = {
    autoStart = true;
    containerConfig = {
      healthCmd = "none";
      image = "lscr.io/linuxserver/transmission:4.1.2";
      autoUpdate = "registry";
      publishPorts = [
        "127.0.0.1:9091:9091"
        "51413:51413"
        "51413:51413/udp"
      ];
      volumes = [
        "/var/lib/containers/storage/volumes/transmission:/config"
        "/mnt:/mnt"
      ];
      environmentFiles = [ config.age.secrets."transmission-env".path ];
    };
    serviceConfig.Restart = "always";
  };

  virtualisation.quadlet.containers.prowlarr = {
    autoStart = true;
    containerConfig = {
      healthCmd = "none";
      image = "lscr.io/linuxserver/prowlarr:nightly";
      autoUpdate = "registry";
      publishPorts = [ "127.0.0.1:9696:9696" ];
      volumes = [
        "/var/lib/containers/storage/volumes/prowlarr:/config"
      ];
    };
    serviceConfig.Restart = "always";
  };
}

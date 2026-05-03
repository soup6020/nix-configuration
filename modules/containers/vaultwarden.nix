{ config, ... }:
{
  virtualisation.quadlet.containers.vaultwarden = {
    autoStart = true;
    containerConfig = {
      image = "docker.io/vaultwarden/server:latest";
      publishPorts = [ "127.0.0.1:8000:80" ];
      volumes = [ "/var/lib/containers/storage/volumes/vaultwarden:/data" ];
      environmentFiles = [ config.age.secrets."vaultwarden-env".path ];
    };
    serviceConfig.Restart = "always";
  };
}

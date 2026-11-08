{ config, ... }:
{
  age.secrets."vaultwarden-env".file = ../../../secrets/vaultwarden-env.age;

  virtualisation.quadlet.containers.vaultwarden = {
    autoStart = true;
    containerConfig = {
      healthCmd = "none";
      image = "docker.io/vaultwarden/server:latest";
      autoUpdate = "registry";
      publishPorts = [ "127.0.0.1:8000:80" ];
      volumes = [ "/var/lib/containers/storage/volumes/vaultwarden:/data" ];
      environments = {
        USE_SYSLOG = "true";
        EXTENDED_LOGGING = "true";
      };
      environmentFiles = [ config.age.secrets."vaultwarden-env".path ];
    };
    serviceConfig.Restart = "always";
  };
}

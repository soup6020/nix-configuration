{ ... }:
{
  virtualisation.quadlet.containers.glance = {
    autoStart = true;
    containerConfig = {
      healthCmd = "none";
      image = "docker.io/glanceapp/glance:latest";
      autoUpdate = "registry";
      publishPorts = [ "127.0.0.1:8080:8080" ];
      volumes = [
        "/var/lib/containers/storage/volumes/glance:/app/config"
      ];
    };
    serviceConfig.Restart = "always";
  };
}

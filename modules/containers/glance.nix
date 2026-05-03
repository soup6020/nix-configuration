{ ... }:
{
  virtualisation.quadlet.containers.glance = {
    autoStart = true;
    containerConfig = {
      image = "docker.io/glanceapp/glance:latest";
      publishPorts = [ "127.0.0.1:8080:8080" ];
      volumes = [
        "/var/lib/containers/storage/volumes/glance:/app/config"
      ];
    };
    serviceConfig.Restart = "always";
  };
}

{ ... }:
{
  virtualisation.quadlet.containers.CONTAINERNAME = {
    autoStart = true;
    containerConfig = {
      image = "docker.io/author/container:latest";
      publishPorts = [ "127.0.0.1:8080:8080" ];
      volumes = [
        "/var/lib/containers/storage/volumes/container-name-here:/config"
      ];
    };
    serviceConfig.Restart = "always";
  };
}

{ ... }:
{
  virtualisation.quadlet.containers.dispatcharr = {
    autoStart = true;
    containerConfig = {
      image = "ghcr.io/dispatcharr/dispatcharr:latest";
      publishPorts = [ "127.0.0.1:9191:9191" ];
      volumes = [
        "/var/lib/containers/storage/volumes/dispatcharr:/data"
      ];
      environments = {
        DISPATCHARR_ENV = "aio";
        REDIS_HOST = "localhost";
        CELERY_BROKER_URL = "redis://localhost:6379/0";
        DISPATCHARR_LOG_LEVEL = "info";
      };
      addCapabilities = [ "SYS_NICE" ];
      devices = [ "/dev/dri:/dev/dri" ];
    };
    serviceConfig.Restart = "always";
  };
}

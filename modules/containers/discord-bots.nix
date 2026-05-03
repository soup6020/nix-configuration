{ ... }:
{
#  virtualisation.quadlet.networks.discord-bots = {
#    autoStart = true;
#    networkConfig.name = "discord-bots";
#  };

#  virtualisation.quadlet.containers.nadeko-redis = {
#    autoStart = true;
#    containerConfig = {
#      image = "docker.io/redis:latest";
#      networks = [ "discord-bots.network" ];
#      hostname = "redis";
#      sysctl = { "net.core.somaxconn" = "511"; };
#      exec = "redis-server --maxmemory 32M --maxmemory-policy volatile-lru";
#      volumes = [ "/srv/nadeko/redis-data:/data" ];
#    };
#    serviceConfig.Restart = "always";
#  };

  virtualisation.quadlet.containers.nadeko = {
    autoStart = true;
    containerConfig = {
      image = "registry.gitlab.com/kwoth/nadekobot:latest";
      #networks = [ "discord-bots.network" ];
      environments = {
        TZ = "America/Vancouver";
        NadekoBot_RedisOptions = "nadeko-redis,name=nadeko";
      };
      volumes = [
        "/var/lib/containers/storage/volumes/nadeko/data:/app/data"
      ];
    };
#    unitConfig.Requires = [ "nadeko-redis.service" ];
#    unitConfig.After = [ "nadeko-redis.service" ];
    serviceConfig.Restart = "always";
  };

  virtualisation.quadlet.containers.mayuri = {
    autoStart = true;
    containerConfig = {
      image = "docker.io/phasecorex/red-discordbot:extra-audio";
      volumes = [
        "/var/lib/containers/storage/volumes/mayuri:/data"
      ];
    };
    serviceConfig.Restart = "always";
  };
}

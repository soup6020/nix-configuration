{ pkgs, ... }:
{
  imports = [
    ./caddy.nix
    ./vaultwarden.nix
    ./torrents.nix
    ./mediaservers.nix
    ./discord-bots.nix
    ./dispatcharr.nix
    ./glance.nix
  ];

  virtualisation.podman = {
    enable = true;
    dockerCompat = false;
    defaultNetwork.settings.dns_enabled = true;
    # autoPrune intentionally disabled — `podman system prune` removes
    # any network that has no running containers, which races with
    # Quadlet units when a container is briefly stopped or failing.
    # Image-only prune is handled by the timer below.
    autoPrune.enable = false;
  };

  systemd.services.podman-image-prune = {
    description = "Prune unused podman images";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.podman}/bin/podman image prune --all --force";
    };
  };

  systemd.timers.podman-image-prune = {
    description = "Weekly podman image prune";
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "weekly";
      Persistent = true;
      RandomizedDelaySec = "1h";
    };
  };

}

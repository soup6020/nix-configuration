{ config, pkgs, ... }:
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

  # Containers opt in with `containerConfig.autoUpdate = "registry";`.
  # `podman auto-update` pulls each opted-in image, and restarts only the
  # units whose image digest actually changed (rolling back on failure).
  virtualisation.quadlet.autoUpdate = {
    enable = true;
    calendar = "*-*-* 04:00:00";
  };

  # Also kick off an update on every `switch`. Non-blocking so the rebuild
  # doesn't wait on registry pulls; follow with `journalctl -fu podman-auto-update`.
  # Skipped during boot activation, before systemd is running.
  system.activationScripts.podman-auto-update = ''
    if [ -d /run/systemd/system ]; then
      ${config.systemd.package}/bin/systemctl start --no-block podman-auto-update.service || true
    fi
  '';

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

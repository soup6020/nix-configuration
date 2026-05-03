{ ... }:
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
    autoPrune.enable = true;
  };

}

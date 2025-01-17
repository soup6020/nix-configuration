{config, lib, pkgs, inputs, ...}:
{
  imports = [
    ./packages.nix
    ./packages-gui.nix
    ./configuration.nix
  ];

  nix.settings = {
    substituters = [
    "https://nix-community.cachix.org"
    ];
    trusted-public-keys = [
    "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
  };

  nix.gc = {
  automatic = true;
  dates = "weekly";
  };

  nixpkgs.config.allowUnfree = true;
  services.nix-daemon.enable = true;
  programs.fish.enable = true;

  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "x86_64-darwin";
}

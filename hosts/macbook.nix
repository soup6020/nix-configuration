{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
  ];

  system.primaryUser = "ezra";

  nix.gc = {
    automatic = true;
    interval = {
      Weekday = 0;
      Hour = 0;
      Minute = 0;
    };
    options = "--delete-older-than 7d";
  };

  nix.settings = {
    substituters = [
      "https://nix-community.cachix.org"
    ];
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    auto-optimise-store = false;
  };

  nixpkgs.config.allowUnfree = true;
  programs.fish.enable = true;

  # Read changelog via darwin-rebuild changelog before changing (ie. do not change)
  system.stateVersion = 5;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "x86_64-darwin";
}

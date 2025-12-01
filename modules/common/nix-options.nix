{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  #Lixify
  nix.package = pkgs.lixPackageSets.stable.lix;
  nixpkgs.overlays = [ (final: prev: {
    inherit (prev.lixPackageSets.stable)
      nixpkgs-review
      nix-eval-jobs
      nix-fast-build
      colmena;
  }) ];

  nix.settings = {
    substituters = [
      "https://hyprland.cachix.org"
      "https://nix-community.cachix.org"
      "https://nvf.cachix.org"
      "https://pwndbg.cachix.org"
    ];
    trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "nvf.cachix.org-1:GMQWiUhZ6ux9D5CvFFMwnc2nFrUHTeGaXRlVBXo+naI="
      "pwndbg.cachix.org-1:HhtIpP7j73SnuzLgobqqa8LVTng5Qi36sQtNt79cD3k="
    ];
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    #auto-optimise-store = true; #Slows down rebuilds as optimization happens every rebuild
  };

  #Automatic optimization with systemd. If the machine is off, it will run on startup.
  nix.optimise.automatic = true;
  nix.optimise.dates = [ "03:45" ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
  };

  nixpkgs.config.allowUnfree = true;
}

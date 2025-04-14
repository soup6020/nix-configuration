{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  nix.settings = {
    substituters = [
      "https://hyprland.cachix.org"
      "https://nix-community.cachix.org"
      "https://nvf.cachix.org"
      "https://walker-git.cachix.org"
      "https://pwndbg.cachix.org"
      "https://ghostty.cachix.org"
    ];
    trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "nvf.cachix.org-1:GMQWiUhZ6ux9D5CvFFMwnc2nFrUHTeGaXRlVBXo+naI="
      "walker-git.cachix.org-1:vmC0ocfPWh0S/vRAQGtChuiZBTAe4wiKDeyyXM0/7pM="
      "pwndbg.cachix.org-1:HhtIpP7j73SnuzLgobqqa8LVTng5Qi36sQtNt79cD3k="
      "ghostty.cachix.org-1:QB389yTa6gTyneehvqG58y0WnHjQOqgnA+wBnpWWxns="
    ];
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    #auto-optimise-store = true; #Slows down rebuilds
    nix.optimise.automatic = true;
    nix.optimise.dates = [ "03:45" ];
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
  };

  nixpkgs.config.allowUnfree = true;
}

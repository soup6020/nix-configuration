{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:

{
  imports = [
    ../modules/desktop/hypr-sway.nix
    ../modules/nvf.nix
    ../modules/pkgs/pkgs-essential.nix
    ../modules/pkgs/liveiso.nix
    ../modules/svc/openssh.nix
  ];

  nix.settings = {
    substituters = [
      "https://hyprland.cachix.org"
      "https://nix-community.cachix.org"
      "https://nvf.cachix.org"
      "https://walker-git.cachix.org"
    ];
    trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "nvf.cachix.org-1:GMQWiUhZ6ux9D5CvFFMwnc2nFrUHTeGaXRlVBXo+naI="
      "walker-git.cachix.org-1:vmC0ocfPWh0S/vRAQGtChuiZBTAe4wiKDeyyXM0/7pM="
    ];
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    auto-optimise-store = true;
  };
  nixpkgs.config.allowUnfree = true;

  isoImage.squashfsCompression = "lz4"; # Optional: Adjust compression level
  isoImage.volumeID = "SoupNixOS"; # Set ISO name

  boot.kernelPackages = pkgs.linuxPackages_latest; # Latest vanilla kernel

  networking.networkmanager.enable = true;
  services.openssh.enable = true;

  environment.systemPackages = with pkgs; [
    inputs.firefox-nightly.packages.${pkgs.system}.firefox-nightly-bin
    nixos-anywhere
    nixos-install
    nixos-install-tools
  ];

  users.users.nixos = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "sudo"
    ];
    password = "nixos"; # Hardcoded because this is for an iso, and there is nothing identifying on it
  };

  services.chrony = {
    enable = true;
    enableNTS = true;
    servers = [ "time.cloudflare.com" ];
  };

  system.stateVersion = "24.05"; # Do not change
}

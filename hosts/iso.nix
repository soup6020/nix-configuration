{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  imports = [
    ../modules/desktop/wayland/hypr.nix
    ../modules/desktop/greetd.nix
    ../modules/common/nvf.nix
    ../modules/pkgs/pkgs-essential.nix
    ../modules/pkgs/liveiso.nix
    ../modules/svc/openssh.nix
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  nix.settings = {
    substituters = [
      "https://hyprland.cachix.org"
      "https://nix-community.cachix.org"
      "https://nvf.cachix.org"
    ];
    trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "nvf.cachix.org-1:GMQWiUhZ6ux9D5CvFFMwnc2nFrUHTeGaXRlVBXo+naI="
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
    inputs.firefox-nightly.packages.${pkgs.stdenv.hostPlatform.system}.firefox-nightly-bin
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
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEdF+kZ34Jgu/mVAh7lBjK01lJ6LUxFdQ9VJuQ8d7psh ezra@wendigo"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOaotCRBxQmuHg2kj/xnyb60iiKxwwNnWObMZt4jpZYG ezra@Ezras-MacBook-Pro.local"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILBKwY3/8eK1UEECe2MSfZFHccMU4W+TWHOFpEtRVDdO u0_a279@localhost"
    ];
    password = "nixos"; # Hardcoded because this is for an iso, and there is nothing identifying on it
  };

  services.chrony = {
    enable = true;
    enableNTS = true;
    servers = [ "time.cloudflare.com" ];
  };

  hjem.users.nixos = {
    enable = true;
    directory = config.users.users.nixos.home;
    clobberFiles = lib.mkForce true;
    files = {
      ".config/fuzzel/fuzzel.ini".source = ../dots/iso/fuzzel/fuzzel.ini;
      ".config/hypr/hyprland.conf".source = ../dots/iso/hypr/hyprland.conf;
      ".config/kitty/kitty.conf".source = ../dots/iso/kitty/kitty.conf;
      ".config/kitty/current-theme.conf".source = ../dots/iso/kitty/current-theme.conf;
      ".config/waybar/style.css".source = ../dots/iso/waybar/style.css;
      ".config/waybar/config.jsonc".source = ../dots/iso/waybar/config.jsonc;
      "Pictures/wallpaper.jpg".source = ../dots/1657650318010.jpg;
    };
  };

  system.stateVersion = "24.05"; # Do not change
}

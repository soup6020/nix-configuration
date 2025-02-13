{ config, pkgs, lib, ... }:

{
  imports = [ 
nixos-generators.nixosModules.iso
../modules/wm.nix
../modules/nvf.nix
../pkgs/pkgs-essential.nix
../pkgs/liveiso.nix
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

  isoImage.squashfsCompression = "gzip";  # Optional: Adjust compression level
  isoImage.volumeID = "SoupNixOS";      # Set ISO name

  boot.loader.grub.enable = false;
  boot.loader.systemd-boot.enable = false;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.networkmanager.enable = true;
  services.openssh.enable = true;
  services.getty.autologin = lib.mkDefault "nixos";

  environment.systemPackages = with pkgs; [
    firefox-nightly.packages.x86_64-linux.default  # Include Firefox Nightly
    nixos-anywhere
    nixos-install
    nixos-install-tools
  ];

  users.users.nixos = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "sudo" ];
    password = "nixos";  # Change for security
  };

  system.stateVersion = "24.05";  # Adjust to match your system version
}


{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ../../users/ezra/nix
    ../../modules/include/steamdeck.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "soupdeck";
  networking.networkmanager.enable = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.plymouth.enable = true;

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.fstrim = {
    enable = true;
    interval = "weekly";
  };

  system.stateVersion = "24.11"; # Did you read the comment?
}

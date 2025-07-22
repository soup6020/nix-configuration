{
  config,
  lib,
  pkgs,
  inputs,
  modulesPath,
  ...
}:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ../../users/ezra/nix
    ../../modules/include/steamdeck.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "soupdeck";
  networking.networkmanager.enable = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  #boot.plymouth.enable = true;

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

  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEdF+kZ34Jgu/mVAh7lBjK01lJ6LUxFdQ9VJuQ8d7psh ezra@wendigo"
  ];

  system.stateVersion = "24.11"; # Did you read the comment?
}

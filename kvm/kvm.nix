# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../common/default.nix
    ../pkgs/pkgs-essential.nix
    ../pkgs/pkgs.nix
    ../pkgs/fonts.nix
    ../pkgs/hypr.nix
    ../pkgs/wendigo-pkgs.nix
    ./services.nix
  ];

  networking.hostName = "nixos-kvm"; # Define your hostname.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  boot.supportedFilesystems = [ "zfs" ];
  boot.zfs.forceImportRoot = false;
  networking.hostId = "ba24c0d6";

  # Qemu guest services
  services.qemuGuest.enable = true;
  services.spice-vdagentd.enable = true;
  hardware.graphics.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
  };

  programs.fish = {
    enable = true;
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ezra = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "video"
      "input"
      "docker"
    ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tmux
      fastfetch
      wofi
      swaynotificationcenter
      vesktop
      wl-clipboard
      swww
      hyprshot
      pavucontrol
      pamixer
    ];
    shell = pkgs.zsh;
  };

  environment.variables.EDITOR = "nvim";

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 22 ];
  #networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Does not work with flakes
  #system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment?

}

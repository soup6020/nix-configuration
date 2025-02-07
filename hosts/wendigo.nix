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
    ./hw-wendigo.nix
    ../common/default.nix
    ../modules/all.nix
    ../pkgs/allpkgs.nix
  ];

  networking.hostName = "wendigo"; # Define your hostname.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  boot.kernelPackages = pkgs.linuxPackages_latest_hardened;
  
  boot.supportedFilesystems = [ "zfs" ];
  boot.zfs.forceImportRoot = false;
  networking.hostId = "ba24c0d6";

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      rocmPackages.clr.icd
    ];
  };
  
  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];

  # Enable CUPS to print documents.
  # services.printing.enable = true;
  programs.firefox.enable = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
  };

  programs.fish = {
    enable = true;
  };

  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
  };

  services.flatpak.enable = true;

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # services.libinput.enable = true;

  users.users.ezra = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "video"
      "input"
      "docker"
      "libvirt"
    ];
    packages = with pkgs; [
    ];
    shell = pkgs.zsh;
  };

  environment.variables.EDITOR = "nvim";

  # Open ports in the firewall.
  #networking.firewall.allowedTCPPorts = [ 22 80 443 ];
  #networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  services.chrony = {
    enable = true;
    enableNTS = true;
    servers = [ "time.cloudflare.com" ];
  };
  
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    extraConfig.pipewire.adjust-sample-rate = {
      "context.properties" = {
        "default.clock.rate" = 192000;
        "default.allowed-rates" = [ 192000 ];
      };
                };
    wireplumber = {
      enable = true;
      package = pkgs.wireplumber;
    };
  };

  #TODO: Remove this? Transmission is now in docker.
  services.transmission = {
    enable = false; # changeme
    user = "ezra";
    group = "ezra";
    home = "/home/ezra";
    settings.rpc-port = "9091";
    settings.peer-port = "51413";
  };

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

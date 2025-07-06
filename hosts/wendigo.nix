{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./hw/hw-wendigo.nix
    ../users/ezra.nix
    ../modules/include/all-wendigo.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "wendigo";
  networking.networkmanager.enable = true;

  boot.kernelPackages = pkgs.linuxPackages_hardened;

  boot.supportedFilesystems = [ "zfs" ];
  boot.zfs.forceImportRoot = false;
  networking.hostId = "ba24c0d6";
  boot.zfs.extraPools = [
    "coldstorage"
    "storage"
    "data"
  ];
  services.zfs.autoScrub.enable = true;
  services.btrfs.autoScrub.enable = true;
  services.btrfs.autoScrub.interval = "weekly";

  #For some reason tmpfs defaults to being disk-backed
  #This goes against systemd default behaviour
  boot.tmp = {
    useTmpfs = true;
    tmpfsSize = "40%";
  };

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

  programs.firefox = {
    enable = true;
    package = pkgs.librewolf-wayland;
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      Preferences = {
        "cookiebanners.service.mode.privateBrowsing" = 2; # Block cookie banners in private browsing
        "cookiebanners.service.mode" = 2; # Block cookie banners
        "privacy.donottrackheader.enabled" = true;
        "privacy.fingerprintingProtection" = true;
        "privacy.resistFingerprinting" = true;
        "privacy.trackingprotection.emailtracking.enabled" = true;
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.fingerprinting.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
        "sidebar.revamp" = true;
        "sidebar.verticalTabs" = true;
        "extensions.pocket.enabled" = false;
        "browser.compactmode.show" = true;
        "image.jxl.enabled" = true;
      };
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
  };

  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
  };

  services.flatpak.enable = true;
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  programs.adb.enable = true;

  programs.nh = {
    enable = true;
    flake = "/home/ezra/nix/";
    package = inputs.nh.packages.${pkgs.system}.nh;
    clean = {
      #Disabled in favour of built-in store optimization at the moment
      enable = false;
      dates = "weekly";
      extraArgs = "--keep 3";
    };
  };

  programs.wireshark = {
    enable = true;
    usbmon.enable = true;
    dumpcap.enable = true;
  };

  # services.libinput.enable = true;

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

  services.smartd = {
    enable = true;
    devices = [
      { device = "/dev/disk/by-id/ata-HGST_HUH721212ALE600_8CGJ70YE"; }
      { device = "/dev/disk/by-id/ata-ST4000DM005-2DP166_ZDH1DYMA"; }
      { device = "/dev/disk/by-id/ata-ST8000VN004-2M2101_WKD023SS"; }
      { device = "/dev/disk/by-id/ata-ST12000NM0538-2K2101_ZHZ69XZN"; }
      { device = "/dev/disk/by-id/ata-ST12000NM0538-2K2101_ZHZ4273E"; }
      { device = "/dev/disk/by-id/ata-ST12000VN0008-2YS101_ZR800P6Y"; }
      { device = "/dev/disk/by-id/ata-WDC_WD40EZRZ-00GXCB0_WD-WCC7K5ZLRDJJ"; }
    ];
    extraOptions = [
      "-A /var/log/smartd/"
      "--interval=26000"
    ];
  };

  services.fstrim = {
    enable = true;
    interval = "weekly";
  };

  environment.systemPackages = with pkgs; [ lact ];
  systemd.packages = with pkgs; [ lact ];
  systemd.services.lactd.wantedBy = [ "multi-user.target" ];

  fonts.fontconfig.useEmbeddedBitmaps = true;
  fonts.fontconfig.defaultFonts.emoji = [ "Twitter Color Emoji" ];
  fonts.fontDir.enable = true;

  security.sudo.package = pkgs.sudo.override { withInsults = true; };

  # Does not work with flakes
  #system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
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

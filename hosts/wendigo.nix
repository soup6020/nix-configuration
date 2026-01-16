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

  networking.hostName = "wendigo";
  # This option is considered experimental, and uses networkd instead of scripted networking
  # May not be necessary for this configuration
  networking.useNetworkd = true;

  systemd.network = {
    enable = true;
    wait-online.anyInterface = true;
    networks."home-lan" = {
      matchConfig.Name = "enp6s0";
      networkConfig.DHCP = "yes";
      linkConfig.RequiredForOnline = "yes";
    };
  };

  # Will cause issues if enabled (conflict with networkd), useless on this machine because the connection is wired
  networking.networkmanager.enable = false;

  services.resolved = {
    enable = true;
    dnssec = "true";
    domains = [ "dns.quad9.net" ];
    fallbackDns = [
      "9.9.9.9"
      "149.112.112.112"
    ];
    dnsovertls = "true";
  };

  services.smartd = {
    enable = true;
    devices = [
      { device = "/dev/disk/by-id/ata-ST4000DM005-2DP166_ZDH1DYMA"; }
      { device = "/dev/disk/by-id/ata-ST8000VN004-2M2101_WKD023SS"; }
      { device = "/dev/disk/by-id/ata-ST12000VN0008-2YS101_ZRT0SVR9"; }
      { device = "/dev/disk/by-id/ata-ST12000NM0538-2K2101_ZHZ69XZN"; }
      { device = "/dev/disk/by-id/ata-WDC_WD122KRYZ-01CDAB0_B010A3PD"; }
      { device = "/dev/disk/by-id/ata-ST12000VN0008-2YS101_ZR800P6Y"; }
      { device = "/dev/disk/by-id/ata-WDC_WD40EZRZ-00GXCB0_WD-WCC7K5ZLRDJJ"; }
    ];
    extraOptions = [
      "-A /var/log/smartd/"
      "--interval=26000"
    ];
    defaults.monitored = "-a -o on -s (S/../.././02|L/../../7/04)";
  };

  programs.firefox = {
    enable = true;
    #TODO: change this to nightly
    #package = pkgs.librewolf-bin;
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

  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
  };

  services.flatpak.enable = true;
  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  programs.nh = {
    enable = true;
    #package = inputs.nixpkgs-unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system}.nh;
    package = inputs.nh.packages.${pkgs.stdenv.hostPlatform.system}.nh;
    flake = "/home/ezra/nix/";
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

  #services.kmscon.enable = true;

  # Open ports in the firewall.
  #networking.firewall.allowedTCPPorts = [ 22 80 443 ];
  #networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  services.chrony = {
    enable = true;
    enableNTS = true;
    servers = [ "time.cloudflare.com" ];
    extraFlags = [
      "-F 1"
      "-r"
    ];
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
        "default.clock.quantum-limit" = 8192;
      };
    };
    wireplumber = {
      enable = true;
      package = pkgs.wireplumber;
    };
  };

  services.udisks2.enable = true;

  environment.systemPackages = with pkgs; [ lact ];
  systemd.packages = with pkgs; [ lact ];
  systemd.services.lactd.wantedBy = [ "multi-user.target" ];

  documentation.man.generateCaches = true;

  services.tailscale = {
    enable = true;
    package = pkgs.tailscale;
    };

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

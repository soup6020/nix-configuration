{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
  ];

  programs.firefox.enable = true;

  services.flatpak.enable = true;
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  xdg.portal.config.common.default = "gtk";

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    daemon.settings.live-restore = true;
    storageDriver = "btrfs";
  };

  services.xserver.enable = true;
  services.xserver.xkb.layout = "us";
  services.xserver.videoDrivers = [ "amdgpu" ];
  services.xserver.excludePackages = with pkgs; [ xterm ];

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
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --sessions ${config.services.displayManager.sessionData.desktops}/share/xsessions:${config.services.displayManager.sessionData.desktops}/share/wayland-sessions --remember --remember-user-session";
        user = "greeter";
      };
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

  services.chrony = {
    enable = true;
    enableNTS = true;
    servers = [ "time.cloudflare.com" ];
  };

  programs.virt-manager.enable = true;
  virtualisation.libvirtd = {
    enable = true;
    qemu.ovmf.enable = true;
  };
  virtualisation.spiceUSBRedirection.enable = true;
}

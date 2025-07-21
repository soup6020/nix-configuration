{
  config,
  lib,
  pkgs,
  imports,
}:
{
  services.xserver.desktopManager.gnome.enable = true;
  hardware.pulseaudio.enable = lib.mkForce false;

  jovian = {

    devices.steamdeck = {
      autoUpdate = true;
      enable = true;
    };

    steam = {
      enable = true;
      user = "ezra";
      autoStart = true;
      desktopSession = "gnome-wayland";
    };

    steamos.useSteamOSConfig = true;

  };
}

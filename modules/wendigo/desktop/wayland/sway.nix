{
  pkgs,
  inputs,
  config,
  ...
}:
{
  imports = [ ./common.nix ];
  xdg.portal.config.sway = {
    default = [ "gtk" ];
    "org.freedesktop.impl.portal.Screenshot" = [ "wlr" ];
    "org.freedesktop.impl.portal.ScreenCast" = [ "wlr" ];
    "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
  };
  xdg.portal.wlr = {
    enable = true;
  };

  xdg.portal.extraPortals = [
    pkgs.xdg-desktop-portal-gtk
    pkgs.xdg-desktop-portal-wlr
  ];

  programs.sway = {
    enable = true;
    package = pkgs.swayfx;
    wrapperFeatures.gtk = true;
    xwayland.enable = true;
  };

  programs.uwsm.waylandCompositors = {
    sway = {
      prettyName = "Sway";
      comment = "Sway compositor managed by UWSM";
      binPath = "/run/current-system/sw/bin/sway";
    };
  };
}

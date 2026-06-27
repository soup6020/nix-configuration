{
  pkgs,
  inputs,
  config,
  ...
}:
{
  imports = [ ./common.nix ];

  xdg.portal.extraPortals = [
    pkgs.xdg-desktop-portal-gtk
    inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland
  ];
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.login.enableGnomeKeyring = true;

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    withUWSM = true;
    xwayland.enable = true;
  };

  programs.uwsm.waylandCompositors = {
    hyprland = {
      prettyName = "Hyprland";
      comment = "Hyprland compositor managed by UWSM";
      binPath = "/run/current-system/sw/bin/start-hyprland";
    };
  };
}

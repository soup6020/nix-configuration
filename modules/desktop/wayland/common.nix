{ pkgs, ... }:
{
  xdg.portal.enable = true;
  xdg.portal.config.common = {
    default = [
      "gtk"
    ];
  };

  environment.systemPackages = with pkgs; [
    foot
    fuzzel
    gammastep
    glpaper
    grim
    grimblast
    hypridle
    hyprlock
    hyprshade
    hyprshot
    mpvpaper
    slurp
    sway-contrib.grimshot
    swaynotificationcenter
    swww
    waybar
    wl-clipboard
  ];
}

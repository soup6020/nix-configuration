{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    papirus-icon-theme
    rose-pine-cursor
    rose-pine-hyprcursor
    rose-pine-gtk-theme
    rose-pine-icon-theme
    tokyonight-gtk-theme
    catppuccin-gtk
  ];
}

{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
    rose-pine-cursor
    tokyonight-gtk-theme
    rose-pine-gtk-theme
    rose-pine-icon-theme
    papirus-icon-theme
  ];
}

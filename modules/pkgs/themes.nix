{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
    papirus-icon-theme
    rose-pine-cursor
    rose-pine-gtk-theme
    rose-pine-icon-theme
    tokyonight-gtk-theme
  ];
}

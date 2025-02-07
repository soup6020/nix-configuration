{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    pkgs.mesa-demos
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
    rose-pine-cursor
    waybar
    tokyonight-gtk-theme
    rose-pine-gtk-theme
    rose-pine-icon-theme
    pkgs.nix-output-monitor
    papirus-icon-theme
  ];
}

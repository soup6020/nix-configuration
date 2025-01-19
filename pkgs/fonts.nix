{ pkgs, ... }:

{
  fonts.packages = [
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.nerd-fonts.iosevka-term
    pkgs.nerd-fonts.droid-sans-mono
    pkgs.nerd-fonts.blex-mono
    pkgs.nerd-fonts.hack
    pkgs.nerd-fonts.meslo-lg
    pkgs.ibm-plex
    pkgs.noto-fonts
  ];
}

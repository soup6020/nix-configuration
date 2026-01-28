{ config, pkgs, ... }:
{
  fonts.fontconfig.useEmbeddedBitmaps = true;
  fonts.fontconfig.defaultFonts.emoji = [ "Twitter Color Emoji" ];
  fonts.fontDir.enable = true;

  fonts.packages = [
    pkgs.ibm-plex
    pkgs.nerd-fonts.blex-mono #Nerd fonts IBM Plex
    pkgs.nerd-fonts.droid-sans-mono
    pkgs.nerd-fonts.hack
    pkgs.nerd-fonts.iosevka-term
    pkgs.nerd-fonts.lilex #modified version of IBM Plex
    pkgs.nerd-fonts.meslo-lg
    pkgs.nerd-fonts.mononoki
    pkgs.nerd-fonts.terminess-ttf
    pkgs.nerd-fonts.zed-mono #modified Iosevka
    pkgs.noto-fonts #Useful fallback fonts
    pkgs.plemoljp-nf #IBM Plex Mono/Plex Sans for Japanese
    pkgs.twitter-color-emoji
  ];
}

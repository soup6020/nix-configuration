{ config, pkgs, ... }:
{
  fonts.fontconfig.useEmbeddedBitmaps = true;
  fonts.fontconfig.defaultFonts.emoji = [ "Twitter Color Emoji" ];
  fonts.fontDir.enable = true;

  fonts.packages = [
    pkgs.ibm-plex
    pkgs.nerd-fonts.blex-mono
    pkgs.nerd-fonts.droid-sans-mono
    pkgs.nerd-fonts.hack
    pkgs.nerd-fonts.iosevka-term
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.nerd-fonts.meslo-lg
    pkgs.nerd-fonts.mononoki
    pkgs.nerd-fonts.zed-mono
    pkgs.noto-fonts
    pkgs.plemoljp-nf
    pkgs.twitter-color-emoji
  ];
}

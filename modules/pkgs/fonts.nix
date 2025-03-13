{ pkgs, ... }:
{
  fonts.fontconfig.useEmbeddedBitmaps = true;
  fonts.fontconfig.defaultFonts.emoji = [ "Twitter Color Emoji" ];
  fonts.fontDir.enable = true;
  fonts.packages = [
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.nerd-fonts.iosevka-term
    pkgs.nerd-fonts.droid-sans-mono
    pkgs.nerd-fonts.blex-mono
    pkgs.nerd-fonts.hack
    pkgs.nerd-fonts.meslo-lg
    pkgs.nerd-fonts.zed-mono
    pkgs.ibm-plex
    pkgs.noto-fonts
    pkgs.nerd-fonts.mononoki
    pkgs.twitter-color-emoji
  ];
}

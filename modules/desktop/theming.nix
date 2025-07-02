{
  config,
  pkgs,
  lib,
  ...
}:
{
  #Gnome/GTK applications
  programs.dconf.profiles.user.databases = [
    {
      settings."org/gnome/desktop/interface" = {
        gtk-theme = "Tokyonight-Dark";
        icon-theme = "Papirus-Dark";
        font-name = "IBM Plex Sans 11";
        document-font-name = "Sans Regular 11";
        monospace-font-name = "IBM Plex Mono 10";
        color-scheme = "prefer-dark";
        cursor-theme = "BreezeX-RosePine-Linux";
      };
      #Prevent modification outside of this file
      lockAll = true;
    }
  ];
}

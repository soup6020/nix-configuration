{
  config,
  pkgs,
  lib,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    nwg-look
    qt6Packages.qt6ct
    papirus-icon-theme
    rose-pine-cursor
    rose-pine-hyprcursor
    rose-pine-gtk-theme
    rose-pine-icon-theme
    tokyonight-gtk-theme
    catppuccin-gtk
  ];

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

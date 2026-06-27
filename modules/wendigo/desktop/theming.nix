{
  config,
  pkgs,
  lib,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    catppuccin-gtk
    nwg-look
    papirus-icon-theme
    qt6Packages.qt6ct
    rose-pine-cursor
    rose-pine-gtk-theme
    rose-pine-hyprcursor
    rose-pine-icon-theme
    tokyonight-gtk-theme
  ];

  #Gnome/GTK applications
  programs.dconf.enable = true;
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
        font-antialiasing = "grayscale";
        font-hinting = "slight";
      };
      #Prevent modification outside of this file
      lockAll = true;
    }
  ];
}

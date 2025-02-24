{ config, pkgs, ... }:

{
  home.username = "ezra";
  home.homeDirectory = "/home/ezra";

  home.packages = with pkgs; [
    ipcalc
  ];

  programs.home-manager.enable = true;
}

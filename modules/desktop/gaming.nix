{ config, pkgs, ... }:
{
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    protonup-ng
    mangohud
    bottles
    ironwail
  ];
}

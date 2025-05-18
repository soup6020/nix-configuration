{ config, pkgs, ... }:
{
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    bottles
    (heroic.override {
      extraPkgs = pkgs: [
        pkgs.gamescope
      ];
    })
    ironwail
    mangohud
    (prismlauncher.override {
      additionalPrograms = [ ffmpeg ];
      jdks = [
        graalvm-ce
        zulu8
        zulu
      ];
    })
    protonup-ng
  ];
}

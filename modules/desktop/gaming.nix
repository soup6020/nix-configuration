{ config, pkgs, ... }:
{

  programs.gamemode.enable = true;
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  environment.systemPackages = with pkgs; [
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
        graalvmPackages.graalvm-ce
        zulu8
        zulu17
        zulu
      ];
    })
    protonup-ng
    protonup-qt
  ];
}

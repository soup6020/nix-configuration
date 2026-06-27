{ config, pkgs, ... }:
{

  programs.gamemode.enable = true;
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    package = pkgs.steam.override {
      extraPkgs =
        pkgs': with pkgs'; [
          gamescope
          keyutils
          libXScrnSaver
          libXcursor
          libXi
          libXinerama
          libkrb5
          libpng
          libpulseaudio
          libvorbis
          mangohud
          stdenv.cc.cc.lib # Provides libstdc++.so.6
        ];
    };
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
    sm64coopdx
    vkquake
  ];
}

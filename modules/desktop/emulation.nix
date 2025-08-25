{ pkgs, inputs, ... }:
#This file contains configuration for console games
#It is inclusive of emulators, hacking tools, and homebrew utilities
let
  retroarchWithCores = (
    pkgs.retroarch.withCores (
      cores: with cores; [
        beetle-psx-hw
        bsnes
        bsnes-hd
        citra
        dolphin
        easyrpg
        flycast
        genesis-plus-gx
        mame
        melonds
        mesen
        mesen-s
        mgba
        mupen64plus
        np2kai
        ppsspp
        sameboy
        swanstation
        tgbdual
      ]
    )
  );
in

{
  #  nixpkgs.overlays = [
  #    (final: prev: {
  #      retroarch-bare = prev.retroarch-bare.overrideAttrs (old: {
  #        src = prev.fetchFromGitHub {
  #          owner = "libretro";
  #          repo = "RetroArch";
  #          rev = "d3c81605be00df9c0eafc8f23da406a3ee197e86";
  #          hash = "sha256-fG4Bs18vlC6QfZPT3OJllKaHmjrg7SIzOwqDR0ZJvBk=";
  #        };
  #      });
  #    })
  #  ];
  environment.systemPackages = with pkgs; [
    retroarchWithCores
    _86Box-with-roms
    ares
    bsnes-hd
    dosbox-x
    easyrpg-player
    flips
    inputs.ps3dec.packages.${pkgs.system}.default
    mame
    mednafen
    melonDS
    mgba
    nanoboyadvance
    pcsx2
    retroarch-assets
    retroarch-joypad-autoconfig
    rpcs3
    xdelta
  ];
}

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
        parallel-n64
        ppsspp
        sameboy
        swanstation
        tgbdual
      ]
    )
  );
in

{
  nixpkgs.overlays = [
    (final: prev: {
      libretro = prev.libretro // {
        parallel-n64 = prev.libretro.parallel-n64.overrideAttrs (old: {
          src = prev.fetchFromGitLab {
            owner = "parallel-launcher";
            repo = "parallel-n64";
            rev = "3b0c31d74f0d2bafcc559fd0a5f2462d2cbcc0c8";
            hash = "sha256-y2GsUC/djCc4iA96N2jmuyKIHSMEVCXKDuMGzJ+qdg4=";
          };
          NIX_CFLAGS_COMPILE = ("") + " -O3 -march=native -Wno-error=implicit-function-declaration";
        });
      };
      #    retroarch-bare = prev.retroarch-bare.overrideAttrs (old: {
      #      src = prev.fetchFromGitHub {
      #        owner = "libretro";
      #        repo = "RetroArch";
      #        rev = "e6328b57074b9eb088aca26dc4d1672596b172ce";
      #        hash = "sha256-nW9D5/X9eU6OQQNkoPO5TsoNH1qMnjizxfGnyCcXjy4=";
      #      };
      #    });
    })
  ];
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

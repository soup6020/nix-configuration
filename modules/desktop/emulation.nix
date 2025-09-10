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
        dolphin
        easyrpg
        flycast
        genesis-plus-gx
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
      retroarch-bare = prev.retroarch-bare.overrideAttrs (old: {
        patches = (old.patches or [ ]) ++ [
          (final.fetchpatch {
            url = "https://github.com/libretro/RetroArch/commit/2bc0a25e6f5cf2b67b183792886e24c2ec5d448e.patch";
            sha256 = "sha256-gkpBql5w/xUpddv/6sePb5kZ5gy9huStDthmvoz6Qbk=";
          })
        ];
      });
    })
  ];
  environment.systemPackages = with pkgs; [
    retroarchWithCores
    _86Box-with-roms
    ares
    azahar
    bsnes-hd
    dosbox-x
    easyrpg-player
    flips
    inputs.ps3dec.packages.${pkgs.system}.default
    mame
    mednafen
    melonDS
    mesen
    mgba
    nanoboyadvance
    pcsx2
    retroarch-assets
    retroarch-joypad-autoconfig
    rpcs3
    sameboy
    xdelta
  ];
}

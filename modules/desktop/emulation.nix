{ pkgs, inputs, ... }:
#This file contains configuration for console games
#It is inclusive of emulators, hacking tools, and homebrew utilities
#Retroarch is commented out because the nixpkgs version kinda sucks, it breaks a lot
#Flatpak user package is in use instead

#let
#  retroarchWithCores = (
#    inputs.nixpkgs-unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system}.retroarch.withCores (
#      cores: with cores; [
#        beetle-psx-hw
#        beetle-saturn
#        bsnes
#        bsnes-hd
#        dolphin
#        easyrpg
#        flycast
#        melonds
#        mesen
#        mesen-s
#        mgba
#        mupen64plus
#        np2kai
#        parallel-n64
#        ppsspp
#        sameboy
#        swanstation
#        tgbdual
#      ]
#    )
#  );
#in

{
#  nixpkgs.overlays = [
#    (final: prev: {
#      libretro = prev.libretro // {
#        parallel-n64 = prev.libretro.parallel-n64.overrideAttrs (old: {
#          src = prev.fetchFromGitLab {
#            owner = "parallel-launcher";
#            repo = "parallel-n64";
#            rev = "e7b29d493b4c00a480c53435882e8bb77b97b473";
#            hash = "sha256-tOlSp7HtNctAD12wD9WEyfaWvysGijAEbEKJ5ssqzQQ=";
#          };
#          NIX_CFLAGS_COMPILE = ("") + " -O3 -march=native -Wno-error=implicit-function-declaration";
#        });
#      };
      #      retroarch-bare = prev.retroarch-bare.overrideAttrs (old: {
      #        patches = (old.patches or [ ]) ++ [
      #          (final.fetchpatch {
      #            url = "https://github.com/libretro/RetroArch/commit/2bc0a25e6f5cf2b67b183792886e24c2ec5d448e.patch";
      #            sha256 = "sha256-gkpBql5w/xUpddv/6sePb5kZ5gy9huStDthmvoz6Qbk=";
      #          })
      #        ];
      #      });
#    })
#  ];
  environment.systemPackages = with pkgs; [
#    retroarchWithCores
    _86Box-with-roms #Vintage x86 emulator
    ares #Multi-system emulator originally by Near
    azahar #3DS emulator
    bsnes-hd #bsnes fork with upscaling features
    dosbox-x #DOSbox fork with advanced functionality and PC-98 emulation
    easyrpg-player #RPGmaker 2000/2003 reimplementation
    flips #ROM patcher
    mame #Needs no introduction
    mame-tools #Useful MAME programs
    mednafen #Headless multi-system emulator
    melonDS #NDS emulator
    mesen #NES/SNES emulator with full debugger and cycle accuracy
    mgba #GBA emulator
    nanoboyadvance #Cycle-accurate GBA emulator
    pcsx2 #PS2 emulator
    #retroarch-assets
    #retroarch-joypad-autoconfig
    rpcs3 #PS3 emulator
    sameboy #Cycle-accurate GB/GBC/SGB emulator
    xdelta #Another ROM patcher
  ];
}

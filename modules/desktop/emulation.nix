{ pkgs, ... }:

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
  environment.systemPackages = [
    retroarchWithCores
    pkgs._86Box-with-roms
    pkgs.ares
    pkgs.bsnes-hd
    pkgs.easyrpg-player
    pkgs.flips
    pkgs.mednafen
    pkgs.melonDS
    pkgs.mgba
    pkgs.nanoboyadvance
    pkgs.pcsx2
    pkgs.retroarch-assets
    pkgs.retroarch-joypad-autoconfig
    pkgs.rpcs3
    pkgs.xdelta
  ];
}

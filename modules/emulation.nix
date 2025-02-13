{ pkgs, ... }:

let
  retroarchWithCores = (
    pkgs.retroarch.withCores (
      cores: with cores; [
        bsnes
        mesen
        mesen-s
        swanstation
        sameboy
        np2kai
        mupen64plus
        mgba
        melonds
        genesis-plus-gx
        flycast
        #easyrpg
        dolphin
        citra
        bsnes-hd
        beetle-psx-hw
        tgbdual
        ppsspp
      ]
    )
  );
in
{
  environment.systemPackages = [
    retroarchWithCores
    pkgs.retroarch-assets
    pkgs.retroarch-joypad-autoconfig
    pkgs.ares
    pkgs.pcsx2
    pkgs.melonDS
    pkgs.mgba
    pkgs.bsnes-hd
    
  ];
}

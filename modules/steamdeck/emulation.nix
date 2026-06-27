{ pkgs, inputs, ... }:
{
  #This file contains configuration for console games
  #It is inclusive of emulators, hacking tools, and homebrew utilities
  environment.systemPackages = with pkgs; [
    _86box-with-roms # Vintage x86 emulator
    ares # Multi-system emulator originally by Near
    azahar # 3DS emulator
    bsnes-hd # bsnes fork with upscaling features
    dosbox-x # DOSbox fork with advanced functionality and PC-98 emulation
    easyrpg-player # RPGmaker 2000/2003 reimplementation
    flips # ROM patcher
    mame # Needs no introduction
    mame-tools # Useful MAME programs
    mednafen # Headless multi-system emulator
    melonds # NDS emulator
    mesen # NES/SNES emulator with full debugger and cycle accuracy
    mgba # GBA emulator
    nanoboyadvance # Cycle-accurate GBA emulator
    pcsx2 # PS2 emulator
    rpcs3 # PS3 emulator
    sameboy # Cycle-accurate GB/GBC/SGB emulator
    xdelta # Another ROM patcher
  ];
}

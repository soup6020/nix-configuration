Welcome to my (shitty) Nix configuration!

Here's a handy guide:

common: stuff that's shared by multiple machines

pkgs: package collections, currently a mess

hosts: configurations for individual machines

modules: individual services, sets of packages, fonts, just about anything that may be reused

home: home manager configuration I may or may not use

To deploy certain outputs:

nixos-rebuild switch --flake .#wendigo

nix build .#live-iso

darwin-rebuild switch .#Ezras-MacBook-Pro

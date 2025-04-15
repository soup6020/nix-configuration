Welcome to my Nix configuration!

Here's a handy guide:

modules/common: stuff that's shared by multiple machines

hosts: configurations for individual machines

modules/etc: individual services, sets of packages, fonts, just about anything that may be reused

modules/pkgs: package collections, kind of a shitshow


To deploy certain outputs:

nixos-rebuild switch --flake .#wendigo

nix build .#live-iso

darwin-rebuild switch .#Ezras-MacBook-Pro

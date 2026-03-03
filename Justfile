set shell := ["nu", "-c"]

default:
	just --list

rebuild:
	nh os switch --ask

darwin-rebuild:
  nh darwin switch . --ask

update-rebuild:
	nix flake update ; nh os switch --ask

forecast-wendigo:
	nix-forecast -c ".#nixosConfigurations.wendigo"

build-iso:
	nixos-rebuild build-image --flake .#live-iso --image-variant iso-installer

format:
	nix fmt

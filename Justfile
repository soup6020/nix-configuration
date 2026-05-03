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

pull-images:
	#!/usr/bin/env bash
	set -euo pipefail
	grep -h '^Image=' /etc/containers/systemd/*.container \
	  | sed 's/^Image=//' \
	  | sort -u \
	  | xargs -rn1 sudo podman pull

restart-containers:
	#!/usr/bin/env bash
	set -euo pipefail
	for f in /etc/containers/systemd/*.container; do
	  basename "$f" .container
	done | xargs -r sudo systemctl restart

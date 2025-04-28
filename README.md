Welcome to my Nix configuration! It is probably pretty ugly, but it works.

Here's a handy guide:

`hosts`: configurations for individual machines. I try to avoid putting anything in here that is likely to be reused, unless it is quite trivial. These files are output-specific.

`modules/common`: stuff that's shared by multiple machines.

`modules/svc`: modules that define and configure services.

`modules/sys`: modules that change system level functionality, changes that are either invasive or use significant resources

`modules/desktop`: graphical, desktop-oriented functionality.

`modules/pkgs`: package collections, kind of a shitshow.

`dots`: non-nix dotfiles to configure programs, currently only used by the liveiso output.

`secrets`: agenix related stuff.

`users`: define user accounts, currently quite barebones.

`treefmt.toml`: configuration for treefmt, which can be invoked by running `nix fmt`. This may move into a nix module at a later date.

To deploy certain outputs:

`nixos-rebuild switch --flake .#wendigo`

`nix build .#live-iso`

`darwin-rebuild switch .#Ezras-MacBook-Pro`

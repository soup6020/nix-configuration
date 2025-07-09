Welcome to my Nix configuration! It is in some ways pretty ugly, but it works. I am specifically avoiding use of home-manager. 

I use hjem to install dotfiles on my live-iso output (this may expand to real systems someday), and I use nvf to manage my NeoVim configuration. Big thanks to NotAShelf for maintaining both of these projects. 

Here's a handy guide:

`hosts/`: Configurations for individual machines. I try to avoid putting anything in here that is likely to be reused, unless it is quite trivial. These files are output-specific.

`hosts/hw`: Hardware setup, largely automatically generated.

`modules/common`: Stuff that's shared by multiple machines.

`modules/darwin`: Darwin-specific configuration, probably barebones because I barely use my Mac.

`modules/svc`: Modules that define and configure services. Note that trivial service definitions may live inside host configurations.

`modules/sys`: Modules that alter system level functionality, changes that are either invasive or use significant resources.

`modules/desktop`: Graphical, desktop-oriented functionality.

`modules/pkgs`: Package collections, not very well organized at the moment.

`dots/`: Non-nix dotfiles to configure programs, currently only used by the liveiso output.


`users/`: Define user accounts, currently quite barebones.

`treefmt.toml`: Configuration for treefmt, which can be invoked by running `nix fmt`. This may move into a nix module at a later date.

To deploy certain outputs:

`nixos-rebuild switch --flake .#wendigo`

`nix build .#live-iso`

`darwin-rebuild switch .#Ezras-MacBook-Pro`

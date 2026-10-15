# Modules that must evaluate on both NixOS and nix-darwin. Options that only
# exist on one platform go in modules/nixos or modules/darwin instead.
{
  imports = [
    ./nix-settings.nix
    ./pkgs-essential.nix
    ./zsh.nix
  ];
}

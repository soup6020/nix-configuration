# in configuration.nix
{ pkgs, lib, inputs, ... }:
# inputs.self, inputs.nix-darwin, and inputs.nixpkgs can be accessed here
{
  nix.gc = {
  automatic = true;
  interval = { Weekday = 0; Hour = 0; Minute = 0; };
  options = "--delete-older-than 14d";
};
}

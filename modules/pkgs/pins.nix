{ inputs, pkgs, ... }:
let
  small = inputs.nixos-unstable-small.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  nixpkgs.overlays = [
    (final: prev: {
      wireshark = small.wireshark;
      wireshark-cli = small.wireshark-cli;
      wireshark-qt = small.wireshark-qt;
    })
  ];
}

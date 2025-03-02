{
  #NOTE: This file is intended for wendigo, it may cause undesirable operation on other hosts.
  imports = [
    ./locale.nix
    ./nix-options.nix
    ./metapod.nix
    ./agenix.nix
    ./openssh.nix
    ./nvf.nix
    ./fonts.nix
    ./sysctl.nix
    ./mpd.nix
    ./greetd.nix
    ./hypr-sway.nix
    ./vm-oci.nix
    ./printing.nix
    ./emulation.nix
    ./gaming.nix
    ./overlays.nix
    ./custompkgs.nix
  ];
}

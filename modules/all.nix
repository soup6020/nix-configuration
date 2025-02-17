{
  #NOTE: deliberately omits modules that only install packages without configuration
  imports = [
    ./metapod.nix
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
  ];
}

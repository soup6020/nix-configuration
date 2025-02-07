{
  #NOTE: deliberately omits modules that only install packages without configuration
  imports = [
    ./metapod.nix
    ./openssh.nix
    ./nvf.nix
    ./fonts.nix
    ./sysctl.nix
    ./mpd.nix
    ./wm.nix
    ./vm-oci.nix
  ];
}

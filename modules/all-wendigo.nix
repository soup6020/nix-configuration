{
  #NOTE: This file is intended for wendigo, it may cause undesirable operation on other hosts.
  imports = [
    ./common/locale.nix
    ./common/nix-options.nix
    ./metapod.nix
    ./common/agenix.nix
    ./svc/openssh.nix
    ./nvf.nix
    ./sysctl.nix
    ./svc/mpd.nix
    ./desktop/greetd.nix
    ./desktop/hypr-sway.nix
    ./vm-oci.nix
    ./svc/printing.nix
    ./desktop/emulation.nix
    ./desktop/gaming.nix
    
    ./overlays.nix
    ./pkgs/allpkgs.nix
    ./custompkgs.nix
  ];
}

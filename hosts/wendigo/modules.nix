{
  #NOTE: This file is intended for wendigo, it may cause undesirable operation on other hosts.
  imports = [
    ../../modules/shared/agenix/agenix.nix
    ../../modules/shared/emacs/emacs.nix
    ../../modules/shared/nix-options.nix
    ../../modules/shared/pkgs-essential.nix
    ../../modules/shared/zsh.nix

    ../../modules/nixos/containers/default.nix
    ../../modules/nixos/desktop/emulation.nix
    ../../modules/nixos/desktop/fonts.nix
    ../../modules/nixos/desktop/gaming.nix
    ../../modules/nixos/desktop/greetd.nix
    ../../modules/nixos/desktop/theming.nix
    ../../modules/nixos/desktop/hypr.nix
    ../../modules/nixos/dev/fhs.nix
    ../../modules/nixos/pkgs/custompkgs.nix
    ../../modules/nixos/pkgs/pins.nix
    ../../modules/nixos/svc/mail.nix
    ../../modules/nixos/svc/mpd.nix
    ../../modules/nixos/svc/nfs-roms.nix
    ../../modules/nixos/svc/printing.nix
    ../../modules/nixos/svc/openssh.nix
    ../../modules/nixos/sys/firewall.nix
    ../../modules/nixos/sys/metapod.nix
    ../../modules/nixos/sys/sysctl.nix
    ../../modules/nixos/sys/vm-oci.nix
  ];
}

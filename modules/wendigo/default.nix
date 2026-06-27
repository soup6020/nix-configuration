{
  #NOTE: This file is intended for wendigo, it may cause undesirable operation on other hosts.
  imports = [
    ../common/agenix/agenix.nix
    ../common/emacs/emacs.nix
    ../common/locale.nix
    ../common/nix-options.nix
    ../common/nvf.nix
    ../common/openssh.nix
    ../common/pkgs-essential.nix
    ../common/zsh.nix

    ./containers/default.nix
    ./desktop/emulation.nix
    ./desktop/fonts.nix
    ./desktop/gaming.nix
    ./desktop/greetd.nix
    ./desktop/polkit.nix
    ./desktop/theming.nix
    ./desktop/wayland/hypr.nix
    ./dev/fhs.nix
    ./pkgs/custompkgs.nix
    ./pkgs/pins.nix
    ./pkgs/wendigo-pkgs.nix
    ./svc/mail.nix
    ./svc/mpd.nix
    ./svc/nfs-roms.nix
    ./svc/printing.nix
    ./sys/firewall.nix
    ./sys/metapod.nix
    ./sys/sysctl.nix
    ./sys/vm-oci.nix
  ];
}

{
  #NOTE: This file is intended for wendigo, it may cause undesirable operation on other hosts.
  imports = [
    ../common/locale.nix
    ../common/nix-options.nix
    ../sys/metapod.nix
    ../common/agenix.nix
    ../svc/openssh.nix
    ../common/nvf.nix
    ../sys/sysctl.nix
    ../svc/mpd.nix
    ../desktop/greetd.nix
    ../desktop/hypr-sway.nix
    ../sys/vm-oci.nix
    ../svc/printing.nix
    ../desktop/emulation.nix
    ../desktop/gaming.nix
    ../desktop/theming.nix
    ../dev/fhs.nix
    ../common/zsh.nix

    ../pkgs/custompkgs.nix
    ../pkgs/wendigo-pkgs.nix
    ../pkgs/themes.nix
    ../pkgs/fonts.nix
    ../pkgs/pkgs-essential.nix
  ];
}

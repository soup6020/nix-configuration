{
  include = [
    ../desktop/jovian.nix
    ../common/nix-options.nix
    ../common/agenix/agenix.nix
    ../svc/openssh.nix
    ../desktop/emulation.nix
    ../desktop/gaming.nix
    ../desktop/theming.nix
    ../pkgs/pkgs-essential.nix
    ../common/nvf.nix
    ../common/zsh.nix
  ];
}

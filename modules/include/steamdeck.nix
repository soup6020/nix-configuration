{
  include = [
    ../desktop/jovian.nix
    ../common/nix-options.nix
    ../common/agenix/agenix.nix
    ../svc/openssh.nix
    ../desktop/emulation.nix
    ../desktop/gaming.nix
    ../pkgs/themes.nix
    ../pkgs/pkgs-essential.nix
    ../common/nvf.nix
    ../common/zsh.nix
  ];
}

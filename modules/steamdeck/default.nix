{
  include = [
    ../common/agenix/agenix.nix
    ../common/nix-options.nix
    ../common/nvf.nix
    ../common/openssh.nix
    ../common/pkgs-essential.nix
    ../common/zsh.nix
    ./emulation.nix
    ./gaming.nix
    ./jovian.nix
  ];
}

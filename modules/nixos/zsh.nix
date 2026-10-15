{
  programs.zsh = {
    #This syntax highlighting is extremely slow, keep it off
    syntaxHighlighting.enable = false;

    # Options are set in modules/shared/zsh.nix; this drops the NixOS defaults.
    setOptions = [ ];
  };
}

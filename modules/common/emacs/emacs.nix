{
  pkgs,
  inputs,
  ...
}:
let
  myEmacs = pkgs.emacsWithPackagesFromUsePackage {
    # NB: Config files cannot contain extended unicode characters, since
    #     they're being parsed in nix, which lacks unicode
    #     support.
    config = ./emacs.el;
    #Links config file to emacs' default.el if true. For some reason evaluation fails if config does not point to a valid file.
    defaultInitFile = false;

    package = pkgs.emacs-unstable-pgtk;
    extraEmacsPackages = epkgs: [
      epkgs.cask
      epkgs.eglot-booster
      epkgs.use-package
      epkgs.vterm
      (epkgs.treesit-grammars.with-grammars (grammars: [
        grammars.tree-sitter-dockerfile
        grammars.tree-sitter-elisp
        grammars.tree-sitter-hyprlang
        grammars.tree-sitter-llvm
        grammars.tree-sitter-markdown
        grammars.tree-sitter-markdown-inline
        grammars.tree-sitter-nix
        grammars.tree-sitter-nu
      ]))
    ];
  };
in
{
  nixpkgs.overlays = [ (import inputs.emacs-overlay) ];
  environment.systemPackages = [
    myEmacs
    #External tools — must be on PATH for emacsclient/daemon
    pkgs.basedpyright
    pkgs.cmake
    pkgs.libvterm
    pkgs.pkg-config
    pkgs.clang-tools
    #pkgs.docker-language-server
    pkgs.go-grip
    pkgs.graphviz-nox
    pkgs.ispell
    pkgs.marksman
    pkgs.nixd
    pkgs.python3Minimal
    pkgs.rust-analyzer
    pkgs.sbcl
    pkgs.shellcheck
    pkgs.yaml-language-server
  ];
  services.emacs = {
    install = true;
    enable = true;
    package = myEmacs;
  };
}

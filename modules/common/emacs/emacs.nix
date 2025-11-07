{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  nixpkgs.overlays = [ (import inputs.emacs-overlay) ];
  environment.systemPackages = [
    (pkgs.emacsWithPackagesFromUsePackage {
      # NB: Config files cannot contain extended unicode characters, since
      #     they're being parsed in nix, which lacks unicode
      #     support.
      config = ./emacs.el;
      #Set this to true after configuration is actually made
      defaultInitFile = false;

      package = pkgs.emacs-unstable-pgtk;
      #Only define elisp pkgs here, LSPs and grammars must be under systemPackages
      extraEmacsPackages = epkgs: [
        epkgs.cask
        epkgs.eglot-booster
        epkgs.use-package
        epkgs.vterm
      ];

    })
    #More pkgs. Must be defined here for emacsclient to find them
    pkgs.basedpyright
    pkgs.clang-tools
    #pkgs.docker-language-server
    pkgs.go-grip
    pkgs.ispell
    pkgs.libvterm
    pkgs.marksman
    pkgs.nixd
    pkgs.nixd
    pkgs.rust-analyzer
    pkgs.sbcl
    pkgs.shellcheck
    pkgs.tree-sitter-grammars.tree-sitter-dockerfile
    pkgs.tree-sitter-grammars.tree-sitter-elisp
    pkgs.tree-sitter-grammars.tree-sitter-llvm
    pkgs.tree-sitter-grammars.tree-sitter-markdown
    pkgs.tree-sitter-grammars.tree-sitter-markdown-inline
    pkgs.tree-sitter-grammars.tree-sitter-nix
    pkgs.tree-sitter-grammars.tree-sitter-nu
    pkgs.yaml-language-server
  ];
  services.emacs = {
    install = true;
    enable = true;
    package = pkgs.emacs-unstable-pgtk;
  };
}

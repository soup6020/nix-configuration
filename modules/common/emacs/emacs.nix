{
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
      #Links config file to emacs' default.el if true
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
    pkgs.graphviz-nox
    pkgs.ispell
    pkgs.libvterm
    pkgs.marksman
    pkgs.nixd
    pkgs.python3Minimal
    pkgs.rust-analyzer
    pkgs.sbcl
    pkgs.shellcheck
    pkgs.tree-sitter-grammars.tree-sitter-dockerfile
    pkgs.tree-sitter-grammars.tree-sitter-elisp
    pkgs.tree-sitter-grammars.tree-sitter-hyprlang
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

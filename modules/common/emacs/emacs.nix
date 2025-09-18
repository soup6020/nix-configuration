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
      # NB: Config files cannot contain unicode characters, since
      #     they're being parsed in nix, which lacks unicode
      #     support.
      config = ./emacs.el;
      #Set this to true after configuration is actually made
      defaultInitFile = false;

      package = pkgs.emacs-unstable-pgtk;

      extraEmacsPackages = epkgs: [
        epkgs.use-package
        epkgs.cask
        epkgs.vterm
        epkgs.eglot-booster
        pkgs.shellcheck
        pkgs.clang-tools
        pkgs.nixd
        pkgs.basedpyright
        pkgs.sbcl
        pkgs.yaml-language-server
        pkgs.marksman
        pkgs.rust-analyzer
        pkgs.docker-language-server
        pkgs.tree-sitter-grammars.tree-sitter-elisp
        pkgs.tree-sitter-grammars.tree-sitter-nix
        pkgs.tree-sitter-grammars.tree-sitter-dockerfile
        pkgs.tree-sitter-grammars.tree-sitter-nu
        pkgs.tree-sitter-grammars.tree-sitter-llvm
        pkgs.tree-sitter-grammars.tree-sitter-elisp
      ];

    })
  ];
  services.emacs = {
    #Make the service available, but do not enable it by default
    install = true;
    package = pkgs.emacs-unstable-pgtk;
  };
}

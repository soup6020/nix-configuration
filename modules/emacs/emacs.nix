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

      package = pkgs.emacs-unstable-pgtk; # replace with pkgs.emacsPgtk, or another version if desired.

      extraEmacsPackages = epkgs: [
        epkgs.use-package
        epkgs.cask
        pkgs.shellcheck
      ];

    })
  ];
}

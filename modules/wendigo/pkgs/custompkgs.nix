{
  config,
  pkgs,
  inputs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    (pkgs.writeShellScriptBin "man-openbsd" ''
      exec ${pkgs.mandoc}/bin/man -M "$HOME/Documents/man/openbsd/usr/share/man" "$@"
    '')
    (pkgs.writeShellScriptBin "man-illumos" ''
      exec ${pkgs.mandoc}/bin/man -M "$HOME/Documents/man/illumos/usr/src/man" "$@"
    '')
    (pkgs.writeShellScriptBin "man-9front" ''
      exec ${pkgs.plan9port}/bin/9 nroff -man "$1" | ${pkgs.util-linux}/bin/col -bx
    '')
    #inputs.capa.packages.${pkgs.stdenv.hostPlatform.system}.default
    #inputs.rom64.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.romcat.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.rzq.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.oftp.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}

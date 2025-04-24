{ config, pkgs, ... }:

{
  nixpkgs.overlays = [
    #    (self: super: {
    #      ghostty = super.ghostty.overrideAttrs (oldAttrs: {
    #        postPatch = ''
    #          # Enable ** globbing
    #          shopt -s globstar
    #          sed -i 's|^const xev = @import("xev");$|const xev = @import("xev").Epoll;|' **/*.zig
    #        '';
    #      });
    #    })
  ];
}

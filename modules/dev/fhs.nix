{
  config,
  lib,
  pkgs,
  ...
}:
{
  #Build a FHS environment with the specified packages, which can be used by running fhs with no arguments
  environment.systemPackages = with pkgs; [
    (pkgs.buildFHSEnv {
      name = "fhs";
      targetPkgs =
        pkgs: with pkgs; [
          alsa-lib
          atk
          cairo
          cups
          curl
          dbus
          expat
          file
          nushell
          fontconfig
          freetype
          fuse
          glib
          gtk3
          libGL
          libnotify
          libxml2
          libxslt
          netcat
          nspr
          nss
          openssl.dev
          pango
          pkg-config
          strace
          udev
          vulkan-loader
          watch
          wget
          which
          libX11
          libxcb
          libXcomposite
          libXcursor
          libXdamage
          libXext
          libXfixes
          libXi
          libXrandr
          libXrender
          libXScrnSaver
          libxshmfence
          libXtst
          xcbutilkeysyms
          zlib
          fontconfig.lib
        ];
      profile = ''export FHS=1'';
      runScript = "nu";
    })
  ];
}

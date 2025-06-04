{
  config,
  lib,
  pkgs,
  ...
}:
{
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
          xorg.libX11
          xorg.libxcb
          xorg.libXcomposite
          xorg.libXcursor
          xorg.libXdamage
          xorg.libXext
          xorg.libXfixes
          xorg.libXi
          xorg.libXrandr
          xorg.libXrender
          xorg.libXScrnSaver
          xorg.libxshmfence
          xorg.libXtst
          xorg.xcbutilkeysyms
          zlib
          fontconfig.lib
        ];
      profile = ''export FHS=1'';
      runScript = "nu";
    })
  ];
}

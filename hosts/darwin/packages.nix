{ pkgs, inputs, ... }:

{
  # packages to be installed _system wide_
  environment.systemPackages = with pkgs; [
    pkgs.bat
    pkgs.btop
    pkgs.bzip3
    pkgs.cmake
    pkgs.coreutils
    pkgs.croc
    pkgs.fish
    pkgs.gifsicle
    pkgs.gnused
    pkgs.htop
    pkgs.imagemagick
    pkgs.ipfs
    pkgs.kalker
    pkgs.megatools
    pkgs.meson
    pkgs.openssh
    pkgs.pandoc
    pkgs.pngcrush
    pkgs.pngquant
    pkgs.rizin
    pkgs.scrcpy
    pkgs.sox
    pkgs.speedtest-cli
    pkgs.starship
    pkgs.tealdeer
    pkgs.testdisk
    pkgs.tmux
    pkgs.torsocks
    pkgs.unar
    pkgs.upx
    pkgs.cargo
    pkgs.vulkan-headers
    pkgs.wavpack
    pkgs.weechat
    pkgs.wireguard-tools
    pkgs.yara
    pkgs.yt-dlp
    pkgs.idevicerestore
    pkgs.android-tools
    pkgs.starship
  ];
}

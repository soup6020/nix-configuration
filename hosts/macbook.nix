{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ../modules/common/nvf.nix
    ../modules/pkgs/macbrew.nix
    ../modules/pkgs/pkgs-essential.nix
    ../modules/pkgs/fonts.nix
  ];

  system.primaryUser = "ezra";

  nix.gc = {
    automatic = true;
    interval = {
      Weekday = 0;
      Hour = 0;
      Minute = 0;
    };
    options = "--delete-older-than 14d";
  };

  nix.settings = {
    substituters = [
      "https://nix-community.cachix.org"
    ];
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    auto-optimise-store = false;
  };

  nixpkgs.config.allowUnfree = true;
  programs.fish.enable = true;

  # Read changelog via darwin-rebuild changelog before changing (ie. do not change)
  system.stateVersion = 5;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "x86_64-darwin";

  environment.systemPackages = with pkgs; [
    pkgs.android-tools
    pkgs.bat
    pkgs.btop
    pkgs.bzip3
    pkgs.cargo
    pkgs.cmake
    pkgs.coreutils
    pkgs.croc
    pkgs.fish
    pkgs.gifsicle
    pkgs.gnused
    pkgs.htop
    pkgs.idevicerestore
    pkgs.imagemagick
    pkgs.ipfs
    pkgs.kalker
    pkgs.libimobiledevice
    pkgs.megatools
    pkgs.meson
    pkgs.nushell
    pkgs.openssh
    pkgs.pandoc
    pkgs.pngcrush
    pkgs.pngquant
    pkgs.rizin
    pkgs.scrcpy
    pkgs.sox
    pkgs.speedtest-cli
    pkgs.starship
    pkgs.starship
    pkgs.tealdeer
    pkgs.testdisk
    pkgs.tmux
    pkgs.torsocks
    pkgs.unar
    pkgs.upx
    pkgs.vulkan-headers
    pkgs.wavpack
    pkgs.weechat
    pkgs.yara
    pkgs.yt-dlp
  ];
}

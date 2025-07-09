{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    #GUI programs
    alacritty
    audacity
    avalonia-ilspy
    brave
    calibre
    (discord-canary.override {
      withOpenASAR = true;
      withVencord = true;
      #withMoonlight = true;
    })
    easyeffects
    (ghidra.withExtensions (
      p: with p; [
        ret-sync
        findcrypt
      ]
    ))
    gimp
    handbrake
    iaito
    inputs.firefox-nightly.packages.${pkgs.system}.firefox-nightly-bin
    inputs.ghostty.packages.${pkgs.system}.ghostty # builds from git
    kitty
    kodi-wayland
    mkvtoolnix
    mpv
    nicotine-plus
    (pkgs.wrapOBS {
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-backgroundremoval
        obs-pipewire-audio-capture
      ];
    })
    pavucontrol
    picard
    remmina
    tor-browser
    transmission-remote-gtk
    vesktop
    wezterm
    xournalpp

    #CLI Programs
    _7zz-rar
    arch-install-scripts
    bat
    beets-unstable
    bingrep
    binwalk
    bomber-go
    bottom
    btop
    carapace
    cava
    checksec
    comma
    compose2nix
    croc
    ctpv
    debootstrap
    distrobox
    distrobox-tui
    dosfstools
    exfatprogs
    exiftool
    ffmpegthumbnailer
    (fortune.override { withOffensive = true; })
    gammastep
    gdb
    gef
    gifsicle
    gifski
    hashcat
    hashcat-utils
    hledger
    hledger-iadd
    hledger-ui
    hledger-utils
    imagemagick
    #idevicerestore
    ilspycmd
    imv
    inputs.pwndbg.packages.${pkgs.stdenv.hostPlatform.system}.pwndbg
    inputs.pwndbg.packages.${pkgs.stdenv.hostPlatform.system}.pwndbg-lldb
    jfsutils
    kalker
    lazygit
    libimobiledevice
    lldb
    lm_sensors
    lsiutil
    lynis
    mediainfo
    megatools
    microfetch
    mktorrent
    modprobed-db
    mpc
    (ncmpcpp.override {
      visualizerSupport = true;
      clockSupport = true;
    })
    netcat-openbsd
    ntfsprogs
    nushell
    nvme-cli
    n-m3u8dl-re
    openocd
    pciutils
    plan9port
    pngcrush
    pngquant
    ripgrep-all
    rmpc
    rustscan
    sbomnix
    shellcheck
    smartmontools
    socat
    sox
    speedtest-go
    speedtest-rs
    sqlite
    starship
    swayimg
    systemctl-tui
    torsocks
    treefmt
    uefitool
    ugrep
    unrar
    unzrip
    upx
    usbutils
    weechat
    xfsprogs
    yara-x
    yazi
    yt-dlp
    zellij
  ];
}

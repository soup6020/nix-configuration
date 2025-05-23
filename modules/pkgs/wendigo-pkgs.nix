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
    brave
    calibre
    (discord-canary.override {
      withOpenASAR = true;
      #withVencord = true;
      withMoonlight = true;
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
    remmina
    tor-browser
    transmission-remote-gtk
    (vesktop.override { electron = pkgs.electron_35; })
    wezterm
    xournalpp

    #CLI Programs
    _7zz-rar
    arch-install-scripts
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
    croc
    ctpv
    debootstrap
    dosfstools
    exfatprogs
    exiftool
    ffmpegthumbnailer
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
    idevicerestore
    avalonia-ilspy
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
    mktorrent
    modprobed-db
    (ncmpcpp.override {
      visualizerSupport = true;
      clockSupport = true;
    })
    netcat-openbsd
    ntfsprogs
    openocd
    nushell
    nvme-cli
    pciutils
    plan9port
    pngcrush
    ripgrep-all
    rmpc
    rustscan
    sbomnix
    shellcheck
    smartmontools
    socat
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
    #TODO: This should REALLY be in a zsh-specific module at some point, see https://discourse.nixos.org/t/zsh-users-how-do-you-manage-plugins/9199
    zsh-fzf-tab
  ];
}

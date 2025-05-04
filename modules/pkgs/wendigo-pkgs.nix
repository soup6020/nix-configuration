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
      withVencord = true;
    })
    easyeffects
    ghidra-bin
    gimp
    handbrake
    iaito
    inputs.firefox-nightly.packages.${pkgs.system}.firefox-nightly-bin
    inputs.ghostty.packages.${pkgs.system}.ghostty # builds from git
    #inputs.walker.packages.${pkgs.system}.default
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
    tor-browser
    transmission-remote-gtk
    (vesktop.override { electron = pkgs.electron_35; })
    wezterm
    xournalpp

    #CLI Programs
    _7zz-rar
    arch-install-scripts
    beets-unstable
    binwalk
    bomber-go
    bottom
    btop
    carapace
    cava
    checksec
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
    helix
    hledger
    hledger-iadd
    hledger-ui
    hledger-utils
    idevicerestore
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
    rmpc
    rustscan
    sbomnix
    shellcheck
    socat
    speedtest-go
    speedtest-rs
    sqlite #Necessary for nix shell carapace completions
    starship
    swayimg
    torsocks
    treefmt
    ugrep
    unzrip
    usbutils
    weechat
    xfsprogs
    yara-x
    yazi
    yt-dlp
    zellij
  ];
}

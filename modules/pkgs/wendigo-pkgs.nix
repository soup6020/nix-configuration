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
    (cutter.withPlugins (
      ps: with ps; [
        jsdec
        rz-ghidra
        sigdb
      ]
    ))
    #darktable
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
    imhex
    inputs.firefox-nightly.packages.${pkgs.system}.firefox-nightly-bin
    inputs.ghostty.packages.${pkgs.system}.ghostty
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
    qgis
    remmina
    rymdport
    tor-browser
    transmission-remote-gtk
    udiskie
    vesktop
    xournalpp

    #CLI Programs
    _7zz-rar
    arch-install-scripts
    bat
    #beets-unstable
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
    #Nixpkgs disables a lot of the offensive fortunes even with the following override
    #(fortune.override { withOffensive = true; })
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
    inetutils
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
    (inputs.nixos-unstable-small.legacyPackages.${pkgs.system}.ncmpcpp.override {
      visualizerSupport = true;
      clockSupport = true;
    })
    netcat-openbsd
    ntfsprogs
    nurl
    nushell
    nvme-cli
    n-m3u8dl-re
    openocd
    pciutils
    plan9port
    pngcrush
    pngquant
    ripgrep-all
    rizin
    rmpc
    rustscan
    sbomnix
    scanmem
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
    tinyxxd
    torsocks
    treefmt
    uefitool
    ugrep
    unrar
    unzrip
    upx
    usbutils
    weechat
    wormhole-william
    xfsprogs
    yara-x
    yazi
    yt-dlp
    zellij
  ];
}

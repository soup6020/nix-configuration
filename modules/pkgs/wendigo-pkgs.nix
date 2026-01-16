{
  pkgs,
  inputs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    #GUI programs
    aegisub
    alacritty
    audacity
    avalonia-ilspy #Graphical .NET disassembler
    brave
    calibre
    cool-retro-term
    (cutter.withPlugins (
      ps: with ps; [
        jsdec
        rz-ghidra
        sigdb
      ]
    ))
    darktable
    (discord-canary.override {
      #withOpenASAR = true;
      withVencord = true;
      #withMoonlight = true;
    })
    easyeffects
    equibop
    (ghidra.withExtensions (
      p: with p; [
        ret-sync
        findcrypt
      ]
    ))
    gimp
    handbrake
    hobbits #Various bit-processing/analysis tools
    iaito #Radare2 GUI
    #imhex
    inputs.firefox-nightly.packages.${pkgs.stdenv.hostPlatform.system}.firefox-nightly-bin
    ghostty
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
    qgis #FOSS GIS software
    remmina
    rymdport #magic-wormhole GUI
    spotify
    tor-browser
    transmission-remote-gtk
    udiskie
    xournalpp

    #CLI Programs
    _7zz-rar
    android-tools
    arch-install-scripts
    bat
    beets
    bingrep
    binwalk
    bomber-go #Scan SBOMs for vulnerabilities
    bottom
    btop
    carapace
    cava
    checksec
    clang
    comma
    compose2nix
    croc
    ctpv
    ctop
    curlie
    cyanrip
    debootstrap
    delta
    distrobox
    distrobox-tui
    dosfstools
    exfatprogs
    exiftool
    e2fsprogs
    ffmpegthumbnailer
    #Nixpkgs disables a lot of the offensive fortunes even with the following override
    (fortune.override { withOffensive = true; })
    gammastep
    gdb
    gef
    gifsicle
    gifski
    git-annex
    gping
    hashcat
    hashcat-utils
    hledger
    hledger-iadd
    hledger-ui
    hledger-utils
    inetutils
    imagemagick
    idevicerestore
    ilspycmd
    imv
    inputs.pwndbg.packages.${pkgs.stdenv.hostPlatform.system}.pwndbg
    inputs.pwndbg.packages.${pkgs.stdenv.hostPlatform.system}.pwndbg-lldb
    jfsutils
    just
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
    (inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system}.ncmpcpp.override {
      visualizerSupport = true;
      clockSupport = true;
    })
    netcat-openbsd
    nix-forecast
    ntfsprogs
    nurl
    nushell
    nvme-cli
    nvtopPackages.amd
    n-m3u8dl-re
    openocd
    pandoc
    pciutils
    plan9port
    pngcrush
    pngquant
    rdap
    ripgrep-all
    rizin
    rmpc
    rustscan
    samurai
    sbomnix
    scanmem
    shellcheck
    smartmontools
    sn0int
    sniffglue
    socat
    sox
    speedtest-go
    speedtest-rs
    sqlite
    starship
    swayimg
    systemctl-tui
    tcpdump
    tinyxxd
    tlrc
    torsocks
    treefmt
    uefitool
    ugrep
    unrar
    unzrip
    upx
    usbutils
    uv
    weechat
    wormhole-william
    xfsprogs
    yara-x
    yazi
    yt-dlp
    zellij
  ];
}

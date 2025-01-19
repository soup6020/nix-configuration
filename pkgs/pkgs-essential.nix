{ pkgs, inputs, ... }:
{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
  };

  environment.systemPackages = with pkgs; [
    vim
    tmux
    wget
    curl
    ripgrep
    kitty
    git
    nmap
    radare2
    mpv
    ffmpeg
    gdu
    libarchive
    gcc
    clang
    gnumake
    uv
    fzf
    skim
    eza
    htop
    rsync
    rclone
    gptfdisk
    dosfstools
    uv
    samurai
    restic
    unzipNLS
    testdisk
    aria2
    iperf
    nh
    fd
    fastfetch
    gping
    dust
    duf
    hex
    lftp
    ncftp
    whois
    mosh
  ];
}

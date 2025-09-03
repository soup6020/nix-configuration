{ pkgs, ... }:

{
  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "uninstall";
      autoUpdate = true;
      upgrade = true;
    };

    taps = [
      "railwaycat/homebrew-emacsmacport"
    ];
    brews = [ ];
    casks = [
      "altserver"
      "bitwarden"
      "blockblock"
      "cutter"
      "dhs"
      "discord"
      "emacs-mac"
      "ghidra"
      "ghostty"
      "hex-fiend"
      "iina"
      "keka"
      "kextviewr"
      "librewolf"
      "openemu"
      "plexamp"
      "reikey"
      "retroarch"
      "tor-browser"
      "transmission-remote-gui"
      "uninstallpkg"
      "veracrypt"
      "whatsyoursign"
      "wireshark"
      "xld"
      "xournal++"
    ];
  };
}

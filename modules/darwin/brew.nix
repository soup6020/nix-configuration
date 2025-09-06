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
      "ghostty"
      "iina"
      "imhex"
      "keka"
      "kextviewr"
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

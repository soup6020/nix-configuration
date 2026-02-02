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
      "keka"
      "kextviewr"
      "plexamp"
      "reikey"
      "retroarch"
      "sameboy"
      "tor-browser"
      "transmission-remote-gui"
      "uninstallpkg"
      "whatsyoursign"
      "wireshark"
      "xld"
    ];
  };
}

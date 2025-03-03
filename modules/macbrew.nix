{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

  ];
  homebrew = {
    enable = true;
    onActivation.cleanup = "uninstall";

    taps = [
      "railwaycat/homebrew-emacsmacport"
    ];
    brews = [ ];
    casks = [
      "altserver"
      "dhs"
      "iina"
      "keka"
      "kextviewr"
      "emacs-mac"
      "veracrypt"
      "temurin"
      "transmission-remote-gui"
      "uninstallpkg"
      "ghidra"
      "hex-fiend"
      "kitty"
      "libreoffice"
      "tor-browser"
      "whatsyoursign"
      "retroarch"
      "discord"
      "plexamp"
      "reikey"
      "openemu"
      "xournal++"
      "cutter"
      "bitwarden"
      "wireshark"
      "blockblock"
      "xld"
      "ghostty"
      "librewolf"
    ];
  };
}

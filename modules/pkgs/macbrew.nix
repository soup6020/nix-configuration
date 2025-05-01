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
      "libreoffice"
      "librewolf"
      "openemu"
      "plexamp"
      "reikey"
      "retroarch"
      "temurin"
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

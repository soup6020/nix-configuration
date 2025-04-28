{
  pkgs,
  config,
  lib,
  ...
}:
{
  users.users.ezra = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
      "video"
      "input"
      "docker"
      "libvirt"
      "adbusers"
    ];

    packages = with pkgs; [
      ripgrep
    ];

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEdF+kZ34Jgu/mVAh7lBjK01lJ6LUxFdQ9VJuQ8d7psh ezra@wendigo"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOaotCRBxQmuHg2kj/xnyb60iiKxwwNnWObMZt4jpZYG ezra@Ezras-MacBook-Pro.local"
    ];
  };
}

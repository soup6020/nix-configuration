{
  pkgs,
  config,
  lib,
  inputs,
  ...
}:
{
  users.users.ezra = {
    isNormalUser = true;
    hashedPasswordFile = config.age.secrets.ezra.path;
    shell = pkgs.zsh;
    #shell = pkgs.nushell;
    extraGroups = [
      "wheel"
      "video"
      "input"
      "docker"
      "podman"
      "libvirt"
      "adbusers"
      "wireshark"
      "dialout"
    ];

    packages = with pkgs; [
      ripgrep
    ];

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEdF+kZ34Jgu/mVAh7lBjK01lJ6LUxFdQ9VJuQ8d7psh ezra@wendigo"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOaotCRBxQmuHg2kj/xnyb60iiKxwwNnWObMZt4jpZYG ezra@Ezras-MacBook-Pro.local"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILBKwY3/8eK1UEECe2MSfZFHccMU4W+TWHOFpEtRVDdO u0_a279@localhost"
    ];
  };
  environment.variables.EDITOR = "nvim";
}

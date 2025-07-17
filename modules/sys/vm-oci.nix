{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  users.groups.libvirtd.members = [ "ezra" ];
  programs.virt-manager.enable = true;

  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      ovmf.enable = true;
      ovmf.packages = [ pkgs.OVMFFull.fd ];
      swtpm.enable = true;
    };
  };

  virtualisation.spiceUSBRedirection.enable = true;
  networking.firewall.trustedInterfaces = [ "virbr0" ];

  environment.etc = {
    "ovmf/edk2-x86_64-secure-code.fd" = {
      source = config.virtualisation.libvirtd.qemu.package + "/share/qemu/edk2-x86_64-secure-code.fd";
    };

    "ovmf/edk2-i386-vars.fd" = {
      source = config.virtualisation.libvirtd.qemu.package + "/share/qemu/edk2-i386-vars.fd";
    };
  };
  systemd.tmpfiles.rules = [
    "L+ /var/lib/qemu/firmware - - - - ${pkgs.qemu_kvm}/share/qemu/firmware"
  ];

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    autoPrune = {
      enable = true;
      flags = [
        "--all"
      ];
    };
    storageDriver = "btrfs";
    liveRestore = lib.mkForce false; # work around a strange issue where shutdowns hang, not ideal
  };

  virtualisation.podman = {
    enable = true;
    extraPackages = [ pkgs.podman-compose ];
    dockerCompat = false; # TODO: Remove this when transition is complete
    autoPrune = {
      enable = true;
      dates = "weekly";
    };
  };
}

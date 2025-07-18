{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [
    "nvme"
    "mpt3sas"
    "usb_storage"
    "xhci_pci"
    "ahci"
    "usbhid"
    "sd_mod"
  ];
  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.kernelModules = [
    "kvm-amd"
    "nct6775"
  ];

  boot.extraModulePackages = with config.boot.kernelPackages; [ zenpower ];
  boot.blacklistedKernelModules = [ "k10temp" ];
  boot.kernelParams = [
    "amd_iommu=on"
  ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/3fd8f070-8a7b-40b6-b221-e126093e7f4a";
    fsType = "btrfs";
    options = [ "compress=zstd" ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/2718-66B4";
    fsType = "vfat";
    options = [
      "fmask=0022"
      "dmask=0022"
    ];
  };

  fileSystems."/mnt/ssd" = {
    device = "/dev/disk/by-uuid/e174a240-d4cc-4389-9c7a-a6460518a68e";
    fsType = "btrfs";
    options = [ "compress=zstd" ];
  };

  #NOTE: This can mostly also be done with boot.tmp, which uses systemd mounts as opposed to fstab mounts.
  #Fstab ensures the device is available earlier, and this deployment does not need additional functionality from systemd.
  #It does not appear possible to set mount options with boot.tmp however.
  fileSystems."/tmp" = {
    fsType = "tmpfs";
    device = "tmpfs";
    options = [
      "nosuid"
      "nodev"
      "relatime"
      "mode=0755" # Lix default permissions mode, tightening this up further causes issues with nix builds
      "size=20G"
    ];
  };

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp6s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp7s0f1.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}

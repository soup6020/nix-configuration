{
        
  programs.virt-manager.enable = true;
  virtualisation.libvirtd = {
    enable = true;
    qemu.ovmf.enable = true;
  };
  virtualisation.spiceUSBRedirection.enable = true;

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    daemon.settings.live-restore = true;
    storageDriver = "btrfs";
  };
}

{
  users.groups.libvirtd.members = ["ezra"];      
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
    liveRestore = false; #work around a strange issue where shutdowns hang, not ideal
  };
}

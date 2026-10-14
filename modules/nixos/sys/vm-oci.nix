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

  virtualisation.lxc = {
    enable = true;
    lxcfs.enable = true;
  };

  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      swtpm.enable = true;
    };
  };

  virtualisation.spiceUSBRedirection.enable = true;
  networking.firewall.trustedInterfaces = [ "virbr0" ];

  # NOTE: EFI firmware paths are handled entirely by the upstream NixOS libvirtd
  # module. It rewrites QEMU's firmware descriptor JSONs so /var/lib/qemu/firmware
  # (libvirt's search dir) points at the stable /run/libvirt/nix-ovmf/ symlinks
  # instead of GC-able /nix/store paths. Do NOT add tmpfiles rules pointing
  # /var/lib/qemu/firmware (or /usr/share/qemu/firmware) at the raw qemu store
  # dir — that overrides the upstream rule and bakes dead store paths into VMs.

  virtualisation.docker = {
    enable = true;
    #extraPackages = [ pkgs.gvisor ];
    enableOnBoot = true;
    autoPrune = {
      enable = true;
      flags = [
        "--all"
      ];
    };
    storageDriver = "btrfs";
    liveRestore = lib.mkForce false; # work around a strange issue where shutdowns hang, not ideal
    daemon.settings = {
      runtimes.runsc = {
        path = "/etc/docker-runtimes/runsc";
        runtimeArgs = [ "--platform=kvm" ];
      };
    };
  };

}

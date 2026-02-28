{ config, pkgs, ... }:
{
  #First set up a read-only bind mount for the ROM directory
  fileSystems."/srv/nfs/shares/roms" = {
    device = "/mnt/ssd/Games/roms";
    options = [ "bind" "ro"];
  };

  #NFS server
  #Shares are also read-only, in addition to the bind mount being RO
  services.nfs.server = {
    enable = true;
    lockdPort = 4001;
    mountdPort = 4002;
    statdPort = 4000;
    exports = ''
    /srv/nfs/shares              192.168.1.0/24(ro,fsid=0)
    /srv/nfs/shares/roms         192.168.1.0/24(ro)
    '';
    };
}

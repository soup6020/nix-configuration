{
  services.printing = {
    enable = true;
    listenAddresses = [ "*:631" ];
    browsing = true;
    defaultShared = true;
    openFirewall = true;
  };
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
    publish = {
      enable = true;
      userServices = true;
    };
  };
}

{
  services.printing = {
    enable = true;
    listenAddresses = [ "*:631" ];
    allowFrom = [ "all" ];
    browsing = true;
    defaultShared = true;
    openFirewall = true;
  };
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
    settings = {
      publish = {
        disable-publishing = false;
        disable-user-service-publishing = false;
        publish-addresses = true;
      };
    };
  };
}

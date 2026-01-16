{
  config,
  pkgs,
  inputs,
  ...
}:
{
  #This currently does not work at all, activation fails
  networking.wireguard = {
    useNetworkd = false; #Not supported with Amnezia
    enable = true;
    interfaces = {

      wg0 = {
        type = "amneziawg";
        privateKeyFile = config.age.secrets.awg-privatekey.path;
        listenPort = 65142;
        ips = [
          "192.168.88.1/24"
        ];

        peers = [
          {
            name = "pixel";
            presharedKeyFile = config.age.secrets.awg-psk.path;
            allowedIPs = [
              "192.168.88.2/32"
            ];
            publicKey = "changeme";
          }
        ];
      };

    };
  };
}

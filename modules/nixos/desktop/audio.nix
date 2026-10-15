{ pkgs, ... }:
{
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    extraConfig.pipewire.adjust-sample-rate = {
      "context.properties" = {
        "default.clock.rate" = 192000;
        "default.allowed-rates" = [ 192000 ];
        "default.clock.quantum-limit" = 8192;
      };
    };
    wireplumber = {
      enable = true;
      package = pkgs.wireplumber;
    };
  };
}

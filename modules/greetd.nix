{ pkgs, inputs, config, ...}:
{

  services.xserver.enable = true;
  services.xserver.xkb.layout = "us";
  services.xserver.videoDrivers = [ "amdgpu" ];
  services.xserver.excludePackages = with pkgs; [ xterm ];

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --sessions ${config.services.displayManager.sessionData.desktops}/share/xsessions:${config.services.displayManager.sessionData.desktops}/share/wayland-sessions --remember --remember-user-session";
        user = "greeter";
      };
    };
  };

  #Prevent systemd from putting logs all over tuigreet
  systemd.services.greetd = {
    serviceConfig.Type = "idle";
    unitConfig.After = [ "docker.service" ];
  };
}

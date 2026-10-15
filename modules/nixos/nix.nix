{
  #Automatic optimization with systemd. If the machine is off, it will run on startup.
  nix.optimise.dates = [ "03:45" ];
  nix.gc.dates = "weekly";
}

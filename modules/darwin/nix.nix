{
  # launchd calendar intervals; matches modules/nixos/nix.nix.
  nix.optimise.interval = {
    Hour = 3;
    Minute = 45;
  };
  nix.gc.interval = {
    Weekday = 0;
    Hour = 0;
    Minute = 0;
  };
}

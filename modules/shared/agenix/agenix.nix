{
  pkgs,
  inputs,
  ...
}:
{
  environment.systemPackages = [ inputs.agenix.packages.${pkgs.stdenv.hostPlatform.system}.default ];
  age.secrets.mpdscribble.file = ./secrets/mpdscribble.age;
  age.secrets.ezra.file = ./secrets/ezra.age;

  # Container env files (consumed by modules under nix/modules/containers/).
  age.secrets."vaultwarden-env".file = ./secrets/vaultwarden-env.age;
  age.secrets."transmission-env".file = ./secrets/transmission-env.age;
  age.secrets."plex-env".file = ./secrets/plex-env.age;
}

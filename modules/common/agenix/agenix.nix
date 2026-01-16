{
  pkgs,
  inputs,
  ...
}:
{
  environment.systemPackages = [ inputs.agenix.packages.${pkgs.stdenv.hostPlatform.system}.default ];
  age.secrets.mpdscribble.file = ./secrets/mpdscribble.age;
  age.secrets.ezra.file = ./secrets/ezra.age;
  age.secrets.awg-privatekey.file = ./secrets/awg-privatekey.age;
  age.secrets.awg-psk.file = ./secrets/awg-psk.age;
}

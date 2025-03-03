{config, lib, pkgs, inputs, ... }:
{
environment.systemPackages = with pkgs; [ inputs.agenix.packages.${system}.default ];
  age.secrets.mpdscribble.file = ../secrets/mpdscribble.age;
}

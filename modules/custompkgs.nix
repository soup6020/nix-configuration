
{ config, pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
        inputs.capa.packages.${pkgs.stdenv.hostPlatform.system}.capa
  ];
}

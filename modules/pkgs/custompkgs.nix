{
  config,
  pkgs,
  inputs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    inputs.capa.packages.${pkgs.stdenv.hostPlatform.system}.default
    #inputs.rom64.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}

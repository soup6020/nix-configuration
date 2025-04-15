{
  description = "Finding beauty in the dissonance";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    agenix.url = "github:ryantm/agenix";
    hyprland.url = "github:hyprwm/Hyprland";
    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";
    nvf.url = "github:notashelf/nvf";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    firefox-nightly.url = "github:nix-community/flake-firefox-nightly";
    walker.url = "github:abenz1267/walker";
    pwndbg.url = "github:pwndbg/pwndbg";
    ghostty.url = "github:ghostty-org/ghostty";
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    capa = {
      url = "github:soup6020/capa";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nix-darwin,
      nixpkgs,
      nvf,
      firefox-nightly,
      nixos-generators,
      agenix,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        wendigo = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/wendigo.nix
            nvf.nixosModules.default
            agenix.nixosModules.default

          ];
        };
      };

      packages.x86_64-linux = {
        live-iso = nixos-generators.nixosGenerate {
          system = "x86_64-linux";
          format = "iso";
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/iso.nix # Define a separate configuration for the ISO
            nvf.nixosModules.default
            agenix.nixosModules.default
          ];
        };
      };

      darwinConfigurations.Ezras-MacBook-Pro = nix-darwin.lib.darwinSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/macbook.nix
          nvf.nixosModules.default
          agenix.darwinModules.default
        ];
      };
    };
}

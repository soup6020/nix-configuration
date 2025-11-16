{
  description = "Finding beauty in the dissonance";

  inputs = {
    #Nixpkgs
    nixos-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-unstable-small.url = "github:NixOS/nixpkgs/nixos-unstable-small";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    #nixpkgs-master.url = "github:NixOS/nixpkgs/master";
    nixpkgs.follows = "nixos-unstable";

    #System
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    #nur = {
    #  url = "github:nix-community/NUR";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};

    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    #Utility modules
    agenix.url = "github:ryantm/agenix";
    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf.url = "github:notashelf/nvf/main";
    nh.url = "github:nix-community/nh";

    #User-facing/applications
    hyprland.url = "github:hyprwm/Hyprland";
    firefox-nightly.url = "github:nix-community/flake-firefox-nightly";
    emacs-overlay.url = "github:nix-community/emacs-overlay";
    jovian.url = "github:Jovian-Experiments/Jovian-NixOS";
    pwndbg.url = "github:pwndbg/pwndbg";
    ps3dec.url = "github:Redrrx/ps3dec";
  };

  outputs =
    {
      self,
      nix-darwin,
      nixpkgs,
      nvf,
      nixos-generators,
      agenix,
      disko,
      jovian,
      ...
    }@inputs:
    {
      nixosConfigurations = {

        wendigo = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/wendigo.nix
            nvf.nixosModules.default
            agenix.nixosModules.default
          ];
        };

        steamdeck = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            disko.nixosModules.disko
            ./hosts/hw/hw-steamdeck.nix
            ./hosts/steamdeck.nix
            agenix.nixosModules.default
            jovian.nixosModules.default
          ];
        };

      };

      packages.x86_64-linux = {
        live-iso = nixos-generators.nixosGenerate {
          format = "iso";
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/iso.nix # Define a separate configuration for the ISO
            nvf.nixosModules.default
            agenix.nixosModules.default
            inputs.hjem.nixosModules.default
          ];
        };
      };

      darwinConfigurations.Ezras-MacBook-Pro = nix-darwin.lib.darwinSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/macbook.nix
          agenix.darwinModules.default
        ];
      };

      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.treefmt;
    };
}

{
  description = "One configuration to rule them all!";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";
    nvf.url = "github:notashelf/nvf";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    firefox-nightly.url = "github:nix-community/flake-firefox-nightly";
    walker.url = "github:abenz1267/walker";
  };

  outputs = {
    self,
    nix-darwin,
    nixpkgs,
    nvf,
    firefox-nightly,
    ...
  } @ inputs: {
    nixosConfigurations = {
      wendigo = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/wendigo.nix
	  nvf.nixosModules.default
        ];
      };
    };
    darwinConfigurations.Ezras-MacBook-Pro = nix-darwin.lib.darwinSystem {
      modules = [
        ./hosts/macbook.nix
        nvf.nixosModules.default

      ];
    };
  };
}

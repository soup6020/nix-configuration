{
  description = "One configuration to rule them all!";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";
    nvf.url = "github:notashelf/nvf";

    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nix-darwin,
    nixpkgs,
    nvf,
    ...
  } @ inputs: {
    nixosConfigurations = {
      nixos-kvm = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;}; # this is the important part
        modules = [
	  ./hosts/kvm/kvm.nix
	  nvf.nixosModules.default
        ];
      };
      wendigo = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/wendigo/wendigo.nix
	  nvf.nixosModules.default
        ];
      };
    };
    darwinConfigurations.Ezras-MacBook-Pro = nix-darwin.lib.darwinSystem {
      modules = [
        ./hosts/darwin/macbook.nix
        nvf.nixosModules.default

      ];
    };
  };
}

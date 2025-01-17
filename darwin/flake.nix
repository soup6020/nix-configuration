{
  description = "One configuration to rule them all!";

  inputs = {
    # NixOS official package source, using the nixos-24.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";
    
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nix-darwin, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      nixos-kvm = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; }; # this is the important part
        modules = [
          ./kvm/kvm.nix
        ];
      };
      wendigo = nixpkgs.lib.nixosSystem {
    	system = "x86_64-linux";
    	specialArgs = { inherit inputs; };
    	modules = [
    	 ./wendigo/wendigo.nix
    	];
    	};
     };
     darwinConfigurations.Ezras-MacBook-Pro = nix-darwin.lib.darwinSystem {
     	modules = [
     	./macbook.nix
     	];
     };
  };
}

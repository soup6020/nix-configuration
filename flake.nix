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
    quadlet-nix = {
      url = "github:SEIAROTg/quadlet-nix";
    };

    #nur = {
    #  url = "github:nix-community/NUR";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    #Utility modules
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    colmena.url = "github:zhaofengli/colmena";

    #User-facing/applications
    hyprland.url = "github:hyprwm/Hyprland";
    firefox-nightly.url = "github:nix-community/flake-firefox-nightly";
    emacs-overlay.url = "github:nix-community/emacs-overlay";
    llm-agents.url = "github:numtide/llm-agents.nix";
    #pwndbg = {
    #  url = "github:pwndbg/pwndbg";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};
    romcat = {
      url = "github:soup6020/romcat";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    oftp = {
      url = "github:soup6020/oftp";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rzq = {
      url = "github:soup6020/rzq";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sameboy-qt = {
      url = "github:soup6020/sameboy-qt";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      agenix,
      quadlet-nix,
      ...
    }@inputs:
    {
      nixosConfigurations = {

        wendigo = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/wendigo/default.nix
            ./users/ezra.nix
            agenix.nixosModules.default
            quadlet-nix.nixosModules.quadlet
          ];
        };

        live-iso = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/liveiso/default.nix
            agenix.nixosModules.default
            inputs.hjem.nixosModules.default
          ];
        };
      };

      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.treefmt;
    };
}

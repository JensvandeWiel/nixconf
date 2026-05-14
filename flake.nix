{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.0.0";

      # Optional but recommended to limit the size of your system closure.
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixos-wsl, lanzaboote, ... }@inputs: {
    nixosConfigurations = {
      worklaptop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./systems/worklaptop/configuration.nix
          ./users/userdef.nix
          inputs.home-manager.nixosModules.default
        ];
      };
      mainpc = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./systems/mainpc/configuration.nix
          ./users/userdef.nix
          inputs.home-manager.nixosModules.default
          lanzaboote.nixosModules.lanzaboote
        ];
      };
    };
  };
}

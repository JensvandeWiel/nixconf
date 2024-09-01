{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      virtualbox = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./systems/virtualbox/configuration.nix
          ./users/userdef.nix
          inputs.home-manager.nixosModules.default
        ];
      };
      tinkerlaptop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./systems/tinkerlaptop/configuration.nix
          ./users/userdef.nix
          inputs.home-manager.nixosModules.default
        ];
      };
    };
  };
}

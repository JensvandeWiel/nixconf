{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
  };

  outputs = { self, nixpkgs, nixos-wsl, ... }@inputs: {
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
        ];
      };
      wsl = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        system = "x86_64-linux";
        modules = [
          nixos-wsl.nixosModules.default
          ./systems/wsl/configuration.nix
          ./users/userdef.nix
          inputs.home-manager.nixosModules.default
        ];
      };
    };
  };
}

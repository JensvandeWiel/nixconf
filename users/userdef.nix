# File used to define users
{config, pkgs, inputs, ...}:

{
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
  };

  imports = [
    ./jens/def.nix
  ];
}
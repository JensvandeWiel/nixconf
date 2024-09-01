{ config, pkgs, inputs, ...}:

{
  imports = [
    ../../general-configuration.nix
    ./hardware-configuration.nix
  ];

  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    curl
    google-chrome
    git
    alacritty
    lf
    libnotify
    vscode
  ];


}
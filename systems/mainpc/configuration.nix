{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:

{
  imports = [
    ../../general-configuration.nix
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = lib.mkForce false;

  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/var/lib/sbctl";
  };

  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    curl
    google-chrome
    git
    ghostty
    lf
    libnotify
    vscode
    sbctl
    protonup-qt
    kdePackages.partitionmanager
  ];

  services.xserver.videoDrivers = [ "amdgpu" ];
}

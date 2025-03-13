# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, wsl, ... }:

{
  imports = [
    ../../users/userdef.nix
  ];
  nixpkgs.config.allowUnfree = true;
  wsl.enable = true;
  wsl.defaultUser = "jens";
  wsl.docker-desktop.enable = true;

  environment.systemPackages = with pkgs; [
    wget
    curl
    git
    lf
  ];

  programs.direnv = {
    enable = true;
    enableZshIntegration = true; # see note on other shells below
    silent = true;
    nix-direnv.enable = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ll = "ls -l";
      la = "ls -a";
      update = "sudo nixos-rebuild switch";
    };
    ohMyZsh = {
      enable = true;
      plugins = ["bazel" "docker" "git" "github" "golang" "rebar" "laravel"];
      theme = "robbyrussell";
    };
  };
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}

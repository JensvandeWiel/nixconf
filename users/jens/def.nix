{pkgs, users, home-manager, ...}: 

{
  home-manager.users."jens" = import ./home.nix;
  users.users.jens = {
    shell = pkgs.zsh;
    isNormalUser = true;
    initialPassword = "12345678";
    description = "Jens van de Wiel";
    extraGroups = [ "networkmanager" "wheel" "docker"];
    packages = with pkgs; [
      github-desktop
      jetbrains-toolbox
      obsidian
      termius
      teamviewer
      slack
      discord
      postman
      # Programming tools
      gh
      cmake
      php84
      php84Packages.composer
      corretto21
      dart
      dotnet-sdk_9
      dotnet-sdk_8
      dotnet-runtime_8
      dotnet-runtime_9
      elixir_1_17
      erlang_27
      flutter
      gcc
      gleam
      rebar3
      go
      gradle
      maven
      nodejs_22
      bun
      python3
      ruby
      rustup
      zig
      sbt
      go-task
      vlang
      bazel
      gnupg
      pinentry-all
      zed-editor
      nerd-fonts.jetbrains-mono
    ];
  };
}
{pkgs, users, home-manager, ...}: 

{
  nixpkgs.overlays = [(self: super: { 
    termius = super.termius.overrideAttrs (oldAttrs: {
      nativeBuildInputs = (oldAttrs.nativeBuildInputs or []) ++ [ super.autoPatchelfHook ];
      buildInputs = (oldAttrs.buildInputs or []) ++ [ super.sqlite ];
    });
  })];

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
      postman
      # Programming tools
      gh
      vesktop
      nixd
      cmake
      php85
      php85Packages.composer
      corretto21
      corretto25
      dart
      dotnet-sdk_9
      dotnet-sdk_8
      dotnet-runtime_8
      dotnet-runtime_9
      elixir_1_17
      erlang_27
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
      spotify
      lazydocker
    ];
  };
}
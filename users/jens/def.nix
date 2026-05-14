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
      slack
      postman
      gh
      vesktop
      nixd
      cmake
      php85
      php85Packages.composer
      corretto21
      corretto25
      elixir_1_19
      erlang
      gcc
      gleam
      rebar3
      go
      gradle
      maven
      nodejs_25
      pnpm
      bun
      python3
      ruby
      rustup
      zig
      sbt
      go-task
      gnupg
      pinentry-all
      zed-editor
      nerd-fonts.jetbrains-mono
      spotify
      lazydocker
      bun
      lmstudio
    ];
  };
}
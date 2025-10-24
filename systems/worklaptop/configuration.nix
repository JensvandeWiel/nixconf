{ config, pkgs, inputs, ...}:

{
  imports = [
    ../../general-configuration.nix
    ./hardware-configuration.nix
  ];

  boot.loader.grub.extraEntries = ''
    GRUB_SAVEDEFAULT=true
    menuentry "Windows (Main)" {
      insmod part_gpt
      insmod fat
      insmod chain
      search --no-floppy --fs-uuid --set=root 95FA-96B0
      chainloader /EFI/Microsoft/Boot/bootmgfw.efi
    }
  '';
  
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


  services.xserver.videoDrivers = ["amd" "nvidia"];


}
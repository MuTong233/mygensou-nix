# Package Manager Settings
{ config, pkgs, ... }:


{  
  #External Package imports
  imports = [
    ./docker.nix # Container Service
    # Virtuallization Support for both Guest and Hypervisior
    ./vmguest.nix # Guest Support
    # ./hypervisior.nix # Hypervisior Support
  ];

  # Install Basic Programs
  programs.bash.enable = true;
  programs.htop.enable = true;
  
  # Install External Programs
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
  programs.thefuck.enable = true;
  programs.java.enable = true;
  programs.less.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    wget
    vlc
    nano
    fish
    tldr
    gparted
    firefox
    libreoffice
    remmina
    noto-fonts-cjk
    rhythmbox
    ffmpeg
    google-chrome
    utillinux
    coreutils
    openssl
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}
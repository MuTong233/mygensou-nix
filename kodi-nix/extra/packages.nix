# Package Manager Settings
{ config, pkgs, ... }:


{  
  #External Package imports
  imports = [
    # Virtuallization Support
    ./vmguest.nix # Guest Support
  ];

  # Install Basic Programs
  programs.htop.enable = true;
  
  # Install External Programs
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
  programs.thefuck.enable = true;
  programs.less.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    wget
    nano
    fish
    tldr
    noto-fonts-cjk
    home-manager
    ffmpeg
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
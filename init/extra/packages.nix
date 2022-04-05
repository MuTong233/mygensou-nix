# Package Manager Settings
{ config, pkgs, ... }:

{  

  # Install Basic Programs
  programs.bash.enable = true;
  
  # Determine the type of the hypervisior
  # If you are running in virtual machine
  # please select the correct guest type.
  # VMware, VirtualBox and Hyper-V are supported.

  virtualisation.vmware.guest.enable = true; # VMware Workstation or ESXi
  # virtualisation.virtualbox.guest.enable = true; # Oracle VirtualBox
  # virtualisation.hypervGuest.enable = true; # Microsoft Hyper-V
  
  # Install External Programs
  programs.steam.enable = true;
  programs.thefuck.enable = true;
  programs.java.enable = true;
  programs.less.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # i do not use wim so i install it here owo
    wget
    vlc
    nano
    fish
    htop
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
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}
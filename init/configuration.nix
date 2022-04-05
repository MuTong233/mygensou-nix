# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix

      # Configure Nix
      ./nix/binaryCaches.nix
      ./nix/common.nix

      # Initialize base system
      ./common/network.nix
      ./common/boot.nix
    ];
  
  # Select internationalisation properties.
  # i18n.defaultLocale = "zh_CN.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };
  i18n.defaultLocale = "zh_CN.UTF-8";

  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [
      noto-fonts
      noto-fonts-cjk # Package renamed
      sarasa-gothic  # 更纱黑体
      source-code-pro
      hack-font
      jetbrains-mono
    ];
    fontconfig = {
      defaultFonts = {
        monospace = [ "Sarasa Mono SC" "DejaVu Sans Mono" ];
        emoji = [ "Noto Color Emoji" ];
        sansSerif = [ "Noto Sans CJK SC" ];
        serif = [ "Noto Serif CJK SC" ];
      };
    };
  };

  i18n.inputMethod = {
    # enabled = "fcitx5";
    # fcitx5.addons = with pkgs; [
    #   fcitx5-rime
    #   fcitx5-chinese-addons
    # ];

    # use ibus instead
    enabled = "ibus";
    ibus.engines = with pkgs.ibus-engines; [
      libpinyin
      rime
    ];
  };
  # Enable the X11 windowing system.
  services.xserver.enable = true;


  # Enable the Plasma 5 Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  

  # Configure keymap in X11
  services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.mutong233 = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
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
  
  # Install Basic Programs
  programs.bash.enable = true;
  
  # Determine the type of the hypervisior
  # VMware, VirtualBox and Hyper-V are supported.
  virtualisation.vmware.guest.enable = true;
  # virtualisation.virtualbox.guest.enable = true;
  # virtualisation.hypervGuest.enable = true;
  
  # Container Configuration
  virtualisation.docker.enable = true;
  
  # Install External Programs
  programs.steam.enable = true;
  programs.thefuck.enable = true;
  programs.java.enable = true;
  programs.less.enable = true;
  
  # List services that you want to enable:

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11"; # Did you read the comment?

}


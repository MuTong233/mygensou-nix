# Container Service
{ pkgs, ... }:

{
  # Enable Docker
  virtualisation.docker = {
      enable = true;
      enableOnBoot = true;
      enableNvidia = false; # NVIDIA GPU wrapper support
      extraOption = ""; # daemon command line specific
  };
}
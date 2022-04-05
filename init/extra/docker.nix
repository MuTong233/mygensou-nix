# Container Service
{ pkgs, ... }:

{
  # Enable Docker
  virtualisation.docker = {
      enable = true;
      enableNvidia = false; # NVIDIA GPU wrapper support
  };
}
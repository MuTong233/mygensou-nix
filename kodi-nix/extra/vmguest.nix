{ pkgs, ...}:
{
  # If you are running in virtual machine
  # please select the correct guest type.
  # VMware, VirtualBox and Hyper-V are supported.

  virtualisation.vmware.guest.enable = true; # VMware Workstation or ESXi

  # WARNING: YOU MAY NEED TO ADD EXTRA OPTIONS TO ENSURE VBOX WORKING
  # virtualisation.virtualbox.guest.enable = true; # Oracle VirtualBox

  # virtualisation.hypervGuest = {
  #  enable = true; # Microsoft Hyper-V
  #  videoMode = "1920x1080"; # Resolution Settings
  # };

  # services.qemuGuest.enable = true; # QEMU Guest

  # hardware.parallels.enable = true; # Parallels Guest
  
  # If you want to enable hypervisior
  # configure it in hypervisior.nix
}
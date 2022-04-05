{ pkgs, ...}:
{
    virtualisation.xen.enable = false; # Xen Hypervisior
    virtualisation.virtualbox.host.enable = false; # VirtualBox Hypervisior
}
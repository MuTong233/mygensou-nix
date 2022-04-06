# 给你吗两拳，崽种
# User Environment Initialize
{ pkgs, ... }:

{
  # Create Default Account for Kodi Media Center
  # To generate your own password, 'use openssl password -6'
  # or 'mkpasswd -m sha-512'
  users.users.kodi = {
    isNormalUser = true;
    hashedPassword = "$6$H0Mo5osK.Y1bf4Lv$XDaK/CiZ9tLgh4E4WKfWf4yUsQ1ngHFIm1rUGN7.PY92n.dwd8gTXtXryZ/sp.7PPWLgg9j/ep/J4Kdd25oKz0"; # password is password
    shell = pkgs.fish;
  };

  # Set root password for unattended install
  # Default password is password, change immediately after
  # the installation.
  users.users.root.hashedPassword = "$6$H0Mo5osK.Y1bf4Lv$XDaK/CiZ9tLgh4E4WKfWf4yUsQ1ngHFIm1rUGN7.PY92n.dwd8gTXtXryZ/sp.7PPWLgg9j/ep/J4Kdd25oKz0";
  users.users.root.shell = pkgs.bash;
  # Enable root's ssh permission
  # for debugging because the kodi account is not in 'wheel' group.
  services.openssh.permitRootLogin = "yes";

}
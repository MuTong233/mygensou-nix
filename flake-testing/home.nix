{ config, pkgs, lib, inputs, system, ... }:
let
  metro-for-steam = (pkgs.callPackage ./packages/metro-for-steam.nix { });
  pkgsOld = import inputs.nixpkgs-old { inherit system; };
in
rec {
  # https://github.com/shadowsocks/libQtShadowsocks
  nixpkgs.config.permittedInsecurePackages =
    [ "botan-1.10.17" "openssl-1.0.2u" ];

  programs.home-manager.enable = true;
  home.stateVersion = "21.11";

  home.username = "mutong233";
  home.homeDirectory = "/home/mutong233";

  home.packages = [
    pkgs.ntfs3g
    pkgs.wimlib
    pkgs.etcher
    pkgs.termius
    pkgs.coreutils
  ];

  imports = [
    ./common/boot.nix
    ./common/i18n.nix
    ./common/network.nix
    ./common.x11.nix
    ./extra/packages.nix
    ./nix/binaryCaches.nix
    ./nix/common.nix
    ./secret/users.nix
  ];

  home.sessionVariables = { NIXPKGS_ALLOW_UNFREE = 1; };

  # https://www.reddit.com/r/pcmasterrace/comments/6u68jw/steam_skins_on_linux/
  home.file.".local/share/Steam/skins/".source = metro-for-steam;
  home.activation."dot-sg_cli" = ''
    unlink ~/.sg_cli.toml && true
    ln -s /run/agenix/dot-sg_cli ~/.sg_cli.toml
  '';
}

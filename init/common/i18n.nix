# Localization Configuration

{ pkgs, home, ... }:
let
  zhwiki = (pkgs.callPackage ../../packages/fcitx/zhwiki.nix) { };
  moegirl = (pkgs.callPackage ../../packages/fcitx/moegirl.nix) { };
  fcitx5-nord = (pkgs.callPackage ../../packages/fcitx/fcitx5-nord.nix) { };
  fcitx5_dicts = (pkgs.callPackage ../../packages/fcitx/fcitx5_dicts.nix) { };
in
{
  # https://github.com/felixonmars/fcitx5-pinyin-zhwiki
  # https://nixos.wiki/wiki/Home_Manager
  home.file.".local/share/fcitx5/pinyin/dictionaries/${zhwiki.fileName}"
  .source = "${zhwiki}/${zhwiki.fileName}";
  home.file.".local/share/fcitx5/pinyin/dictionaries/${moegirl.fileName}"
  .source = "${moegirl}/${moegirl.fileName}";
  home.file.".local/share/fcitx5/themes/".source = "${fcitx5-nord}";
  home.file.".local/share/fcitx5/pinyin/dictionaries/${fcitx5_dicts.fileName}"
  .source = "${fcitx5_dicts}/${fcitx5_dicts.fileName}";
  
  # Select internationalisation properties.
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

    # Set Default Fonts
    fontconfig = {
      defaultFonts = {
        monospace = [ "Sarasa Mono SC" "DejaVu Sans Mono" ];
        emoji = [ "Noto Color Emoji" ];
        sansSerif = [ "Noto Sans CJK SC" ];
        serif = [ "Noto Serif CJK SC" ];
      };
    };
  };
  
  # Input support for Chinese
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
}
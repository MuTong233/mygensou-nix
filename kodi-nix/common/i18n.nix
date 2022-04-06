# Localization Configuration

{ pkgs, home, ... }:

{

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
  
  # ibus and fcitx were removed because kodi doesn't require input method.

}
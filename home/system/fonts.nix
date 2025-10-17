{ pkgs, ... }: {
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    andika
    nerd-fonts.fira-code
    nerd-fonts.recursive-mono
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    symbola
  ];

  xdg.configFile."fontconfig/fonts.conf".source = ../../config/fontconfig/fonts.conf;
}

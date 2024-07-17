{ pkgs, ... }: {
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    andika
    noto-fonts-cjk
    noto-fonts-emoji
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
    symbola
  ];

  xdg.configFile."fontconfig/fonts.conf".source = ../../config/fontconfig/fonts.conf;
}

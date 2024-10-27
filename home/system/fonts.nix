{ pkgs, ... }: {
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    andika
    noto-fonts-cjk-sans
    noto-fonts-emoji
    (nerdfonts.override { fonts = [ "FiraCode" "Recursive" ]; })
    symbola
  ];

  xdg.configFile."fontconfig/fonts.conf".source = ../../config/fontconfig/fonts.conf;
}

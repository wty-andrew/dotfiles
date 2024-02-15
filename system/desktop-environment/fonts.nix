{ pkgs, ... }: {
  fonts.packages = with pkgs; [
    comic-relief
    noto-fonts-cjk
    noto-fonts-emoji
    (nerdfonts.override { fonts = [ "FiraCode" "DejaVuSansMono" "SourceCodePro" ]; })
  ];
}

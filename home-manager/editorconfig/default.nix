{ pkgs, ... }: {
  editorconfig.enable = true;
  home.file.".editorconfig".source = ./editorconfig;
}

{ ... }: {
  programs.git.enable = true;

  home.file.".gitconfig".source = ../../config/.gitconfig;
}

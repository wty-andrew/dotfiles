{ pkgs, ... }: {
  home.packages = with pkgs; [
    diff-so-fancy
  ];

  programs.git.enable = true;

  home.file.".gitconfig".source = ../../config/.gitconfig;
}

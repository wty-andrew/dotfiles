{ pkgs, ... }: {
  home.packages = with pkgs; [
    delta
    gitmoji-cli
  ];

  programs.git.enable = true;

  home.file = {
    ".gitconfig".source = ../../config/.gitconfig;
    ".gitignore".source = ../../config/.gitignore;
  };
}

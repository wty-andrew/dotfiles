{ pkgs, ... }: {
  home.packages = with pkgs; [
    delta
    gh
    gitmoji-cli
  ];

  programs.git = {
    enable = true;
    lfs.enable = true;
  };

  home.file = {
    ".gitconfig".source = ../../config/.gitconfig;
    ".gitignore".source = ../../config/.gitignore;
  };

  programs.lazygit = {
    enable = true;
  };

  programs.zsh.initExtra = ''
    function lg() {
      export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir

      lazygit "$@"

      if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
        cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
        rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
      fi
    }
  '';

  xdg.configFile = {
    "delta/themes/catppuccin.gitconfig".source = pkgs.fetchFromGitHub
      {
        owner = "catppuccin";
        repo = "delta";
        rev = "765eb17d0268bf07c20ca439771153f8bc79444f";
        sha256 = "sha256-GA0n9obZlD0Y2rAbGMjcdJ5I0ij1NEPBFC7rv7J49QI=";
      } + /catppuccin.gitconfig;

    "lazygit".source = ../../config/lazygit;
  };
}

{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    delta
    gh
    gitbutler
    gitmoji-cli
    pre-commit
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

  programs.zsh.initContent = ''
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
    "delta/themes/catppuccin.gitconfig".source = "${config.catppuccin.sources.delta}/catppuccin.gitconfig";

    "lazygit".source = ../../config/lazygit;
  };
}

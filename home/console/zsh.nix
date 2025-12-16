{ config, pkgs, lib, ... }: {
  home.packages = with pkgs; [
    fzf
  ];

  programs.zoxide.enable = true;

  programs.zsh = {
    enable = true;

    # this is new default for home.stateVersion 26.05
    dotDir = "${config.xdg.configHome}/zsh";

    oh-my-zsh = {
      enable = true;
      plugins = [
        "colored-man-pages"
        "docker"
        "git"
        "kubectl"
        "pip"
        "poetry"
        "sbt"
        "scala"
        "terraform"
      ];
    };

    autosuggestion.enable = true;

    syntaxHighlighting = {
      enable = true;
    };

    initContent = lib.mkOrder 550 ''
      fpath+=(${toString ../../config/zsh/site-functions})
    '';

    plugins = with pkgs; [
      {
        name = "fzf-tab";
        src = zsh-fzf-tab;
        file = "share/fzf-tab/fzf-tab.plugin.zsh";
      }
      {
        name = "forgit";
        src = zsh-forgit;
        file = "share/zsh/zsh-forgit/forgit.plugin.zsh";
      }
      {
        name = "zsh-vi-mode";
        src = zsh-vi-mode;
        file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
      }
    ];
  };

  catppuccin.zsh-syntax-highlighting = {
    enable = true;
    flavor = "frappe";
  };
}

{ pkgs, ... }: {
  home.packages = with pkgs; [
    fzf
  ];

  programs.zoxide.enable = true;

  programs.zsh = {
    enable = true;

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
        "yarn"
      ];
    };

    autosuggestion.enable = true;

    syntaxHighlighting = {
      enable = true;

      catppuccin = {
        enable = true;
        flavor = "frappe";
      };
    };

    initExtraBeforeCompInit = ''
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
}

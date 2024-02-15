{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    fzf
    lsd
    zoxide
  ];

  programs.zsh = {
    enable = true;

    shellAliases = {
      ls = "lsd --group-directories-first";
      l = "ls -l";
      la = "ls -a";
      lla = "ls -la";
      lt = "ls --tree";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "colored-man-pages"
        "docker"
        "gcloud"
        "git"
        "helm"
        "kubectl"
        "pip"
        "poetry"
        "sbt"
        "scala"
        "terraform"
        "yarn"
      ];
    };

    plugins = [
      {
        name = "fzf-tab";
        src = pkgs.fetchFromGitHub {
          owner = "Aloxaf";
          repo = "fzf-tab";
          rev = "c2b4aa5ad2532cca91f23908ac7f00efb7ff09c9";
          hash = "sha256-gvZp8P3quOtcy1Xtt1LAW1cfZ/zCtnAmnWqcwrKel6w=";
        };
      }
      {
        name = "forgit";
        src = pkgs.fetchFromGitHub {
          owner = "wfxr";
          repo = "forgit";
          rev = "48e91dadb53f7ac33cab238fb761b18630b6da6e";
          hash = "sha256-WvJxjEzF3vi+YPVSH3QdDyp3oxNypMoB71TAJ7D8hOQ=";
        };
      }
      {
        name = "zsh-vi-mode";
        src = pkgs.fetchFromGitHub {
          owner = "jeffreytse";
          repo = "zsh-vi-mode";
          rev = "ea1f58ab9b1f3eac50e2cde3e3bc612049ef683b";
          hash = "sha256-xbchXJTFWeABTwq6h4KWLh+EvydDrDzcY9AQVK65RS8=";
        };
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "bb27265aeeb0a22fb77f1275118a5edba260ec47";
          hash = "sha256-bD0oKXSw9lucJR+6/O16m7prwA1cP36C0Tvh5mklapw=";
        };
      }
      {
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "c3d4e576c9c86eac62884bd47c01f6faed043fc5";
          hash = "sha256-B+Kz3B7d97CM/3ztpQyVkE6EfMipVF8Y4HJNfSRXHtU=";
        };
      }
    ];
  };

  programs.zoxide.enable = true;
}

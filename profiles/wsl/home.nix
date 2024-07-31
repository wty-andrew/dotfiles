{ ... }: {
  imports = [
    ../base/home.nix

    ../../home/console
    ../../home/editor/emacs.nix
    ../../home/editor/neovim.nix
    ../../home/devops
    ../../home/lang
    ../../home/system/fonts.nix
    ../../home/tools
  ];

  home.sessionVariables = {
    BROWSER = "wslview";
    EDITOR = "nvim";
  };

  home.sessionPath = [
    "/snap/bin"
  ];
}

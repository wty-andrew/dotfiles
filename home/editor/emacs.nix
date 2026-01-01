{ config, pkgs, helpers, ... }: {
  programs.emacs = {
    enable = true;

    package = pkgs.emacs-unstable-pgtk;

    extraPackages = epkgs: [
      epkgs.vterm
    ];
  };

  services.emacs.enable = true;

  home.packages = with pkgs; [
    buku
    editorconfig-core-c
    graphviz
    ripgrep
    shellcheck
    sqlite
    texlive.combined.scheme-full
  ];

  xdg.configFile."doom".source = config.lib.file.mkOutOfStoreSymlink (helpers.runtimePath ../../config/doom);

  home.sessionPath = [
    "${config.home.homeDirectory}/.emacs.d/bin"
  ];
}

{ config, pkgs, helpers, ... }: {
  programs.emacs = {
    enable = true;

    package = pkgs.emacs-pgtk;

    extraPackages = (epkgs: [
      epkgs.vterm
    ]);
  };

  services.emacs.enable = true;

  home.packages = with pkgs; [
    editorconfig-core-c
    ripgrep
    shellcheck
    sqlite
    texlive.combined.scheme-medium
  ];

  home.file.".config/doom".source = config.lib.file.mkOutOfStoreSymlink (helpers.runtimePath ../../config/doom);

  home.sessionPath = [
    "${config.home.homeDirectory}/.emacs.d/bin"
  ];
}

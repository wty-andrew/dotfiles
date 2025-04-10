{ config, pkgs, helpers, ... }: {
  home.packages = with pkgs; [
    presenterm
    pandoc
    typst
  ];

  xdg.configFile."presenterm".source = config.lib.file.mkOutOfStoreSymlink (helpers.runtimePath ../../config/presenterm);
}

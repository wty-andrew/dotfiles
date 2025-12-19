{ config, pkgs, helpers, ... }: {
  home.packages = with pkgs; [
    ghostty
  ];

  xdg.configFile."ghostty".source = config.lib.file.mkOutOfStoreSymlink (helpers.runtimePath ../../config/ghostty);
}

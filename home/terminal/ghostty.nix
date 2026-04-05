{ config, helpers, ... }: {
  programs.ghostty = {
    enable = true;
  };

  xdg.configFile."ghostty".source = config.lib.file.mkOutOfStoreSymlink (helpers.runtimePath ../../config/ghostty);
}

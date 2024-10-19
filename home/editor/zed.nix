{ config, pkgs, helpers, ... }: {
  home.packages = with pkgs; [
    zed-editor
  ];

  xdg.configFile."zed".source = config.lib.file.mkOutOfStoreSymlink (helpers.runtimePath ../../config/zed);
}

{ config, pkgs, helpers, ... }: {
  home.packages = with pkgs; [
    rio
  ];

  xdg.configFile."rio".source = config.lib.file.mkOutOfStoreSymlink (helpers.runtimePath ../../config/rio);
}

{ config, pkgs, helpers, ... }: {
  home.packages = with pkgs; [
    satty
  ];

  xdg.configFile."satty".source = config.lib.file.mkOutOfStoreSymlink (helpers.runtimePath ../../config/satty);
}

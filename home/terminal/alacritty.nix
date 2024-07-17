{ config, pkgs, helpers, ... }: {
  home.packages = with pkgs; [
    alacritty
  ];

  xdg.configFile."alacritty".source = config.lib.file.mkOutOfStoreSymlink (helpers.runtimePath ../../config/alacritty);
}

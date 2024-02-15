{ config, pkgs, helpers, ... }: {
  home.packages = with pkgs; [
    unstable.alacritty
  ];

  home.file.".config/alacritty".source = config.lib.file.mkOutOfStoreSymlink (helpers.runtimePath ../../config/alacritty);
}

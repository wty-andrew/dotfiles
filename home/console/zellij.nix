{ config, pkgs, helpers, ... }: {
  home.packages = with pkgs; [
    zellij
  ];

  xdg.configFile."zellij".source = config.lib.file.mkOutOfStoreSymlink (helpers.runtimePath ../../config/zellij);
}

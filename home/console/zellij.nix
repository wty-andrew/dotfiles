{ config, pkgs, helpers, ... }: {
  home.packages = with pkgs; [
    zellij
  ];

  home.file.".config/zellij".source = config.lib.file.mkOutOfStoreSymlink (helpers.runtimePath ../../config/zellij);
}

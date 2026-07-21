{ config, pkgs, helpers, ... }: {
  home.packages = with pkgs; [
    codex
  ];

  home.file.".codex".source = config.lib.file.mkOutOfStoreSymlink (helpers.runtimePath ../../config/codex);
}

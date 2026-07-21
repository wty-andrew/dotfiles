{ config, pkgs, helpers, ... }: {
  home.packages = with pkgs; [
    claude-code
  ];

  home.file.".claude".source = config.lib.file.mkOutOfStoreSymlink (helpers.runtimePath ../../config/claude);
}

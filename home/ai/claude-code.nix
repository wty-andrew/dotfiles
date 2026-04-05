{ config, pkgs, helpers, ... }: {
  home.packages = with pkgs.stable; [ # TODO: unstable currently broken
    claude-code
  ];

  home.file.".claude".source = config.lib.file.mkOutOfStoreSymlink (helpers.runtimePath ../../config/claude);
}

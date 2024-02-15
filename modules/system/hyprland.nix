{ config, helpers, ... }: {
  home.file.".config/hypr".source = config.lib.file.mkOutOfStoreSymlink (helpers.runtimePath ../../config/hypr);
}

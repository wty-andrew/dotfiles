{ config, helpers, ... }: {
  programs.atuin.enable = true;

  xdg.configFile."atuin".source = config.lib.file.mkOutOfStoreSymlink (helpers.runtimePath ../../config/atuin);
}

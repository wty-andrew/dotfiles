{ config, helpers, ... }: {
  programs.atuin.enable = true;

  home.file.".config/atuin".source = config.lib.file.mkOutOfStoreSymlink (helpers.runtimePath ../../config/atuin);
}

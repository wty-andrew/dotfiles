{ config, helpers, ... }: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink (helpers.runtimePath ../../config/nvim);
}

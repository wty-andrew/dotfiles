{ pkgs, config, helpers, ... }: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    package = pkgs.stable.neovim-unwrapped;
    sideloadInitLua = true;
    # new default for home.stateVersion 26.05
    withRuby = false;
    withPython3 = false;
  };

  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink (helpers.runtimePath ../../config/nvim);
}

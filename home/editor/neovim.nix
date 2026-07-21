{ config, pkgs, helpers, ... }: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    sideloadInitLua = true;
    # new default for home.stateVersion 26.05
    withRuby = false;
    withPython3 = false;
  };

  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink (helpers.runtimePath ../../config/nvim);

  # For pointing to the library in .luarc.json
  xdg.dataFile."nvim-runtime".source = "${pkgs.neovim-unwrapped}/share/nvim/runtime";
}

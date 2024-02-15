{ config, helpers, ... }: {
  programs.wezterm.enable = true;

  xdg.configFile."wezterm/wezterm.lua".enable = false;

  home.file.".config/wezterm" = {
    source = config.lib.file.mkOutOfStoreSymlink (helpers.runtimePath ../../config/wezterm);
  };
}

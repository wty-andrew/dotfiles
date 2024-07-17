{ config, helpers, ... }: {
  programs.wezterm.enable = true;

  xdg.configFile = {
    "wezterm/wezterm.lua".enable = false;
    "wezterm".source = config.lib.file.mkOutOfStoreSymlink (helpers.runtimePath ../../config/wezterm);
  };
}

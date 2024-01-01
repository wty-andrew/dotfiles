{ config, ... }: {
  programs.wezterm.enable = true;

  xdg.configFile."wezterm/wezterm.lua".enable = false;

  home.file.".config/wezterm" = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/andrew/dotfiles/config/wezterm";
  };
}

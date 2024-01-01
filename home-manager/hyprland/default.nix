{ config, ... }: {
  home.file.".config/hypr".source = config.lib.file.mkOutOfStoreSymlink "/home/andrew/dotfiles/config/hypr";
}

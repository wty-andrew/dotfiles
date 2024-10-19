_: {
  xdg = {
    # adds XDG_CACHE_HOME, XDG_CONFIG_HOME, XDG_DATA_HOME, XDG_STATE_HOME
    enable = true;

    userDirs = {
      enable = true;
      createDirectories = true;
      desktop = null;
      publicShare = null;
      templates = null;
    };
  };
}

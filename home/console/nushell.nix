{ config, pkgs, helpers, ... }: {
  home.packages = with pkgs; [
    nushell
  ];

  xdg.configFile."nushell".source = config.lib.file.mkOutOfStoreSymlink (helpers.runtimePath ../../config/nushell);
}

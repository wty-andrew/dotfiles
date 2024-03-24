{ config, pkgs, helpers, ... }: {
  home.packages = with pkgs; [
    nushell
  ];

  home.file.".config/nushell".source = config.lib.file.mkOutOfStoreSymlink (helpers.runtimePath ../../config/nushell);
}

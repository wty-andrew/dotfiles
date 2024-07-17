{ inputs, config, pkgs, helpers, ... }: {
  imports = [ inputs.ags.homeManagerModules.default ];

  home.packages = with pkgs; [
    sassc
  ];

  programs.ags = {
    enable = true;

    extraPackages = with pkgs; [
      libsoup_3
    ];
  };

  xdg.configFile."ags".source = config.lib.file.mkOutOfStoreSymlink (helpers.runtimePath ../../config/ags);
}

{ inputs, config, pkgs, helpers, ... }: {
  wayland.windowManager.hyprland.enable = false;

  home.packages = [
    inputs.hyprpicker.packages.${pkgs.stdenv.hostPlatform.system}.hyprpicker
  ];

  services.wayle = {
    enable = true;
  };

  xdg.configFile."hypr".source = config.lib.file.mkOutOfStoreSymlink (helpers.runtimePath ../../config/hypr);
}

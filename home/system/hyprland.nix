{ inputs, pkgs, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;

    plugins = [
      # TODO:
    ];

    systemd.enable = true;

    settings = {
      env = [
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
      ];
    };
  };

  home.packages = [
    inputs.hyprpicker.packages.${pkgs.stdenv.hostPlatform.system}.hyprpicker
  ];
}

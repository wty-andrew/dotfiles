{ pkgs, ... }: {
  programs.hyprland.enable = true;

  programs.nm-applet.enable = true;

  environment.systemPackages = with pkgs; [
    # wallpaper
    hyprpaper
    swww

    # clipboard
    cliphist
    wl-clipboard

    # app launcher
    rofi-wayland # TODO: remove when ags is ready

    # misc
    libnotify
  ];

  security.pam.services.swaylock = {};

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # hint for electron apps
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };
}

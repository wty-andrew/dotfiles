{ inputs, pkgs, ... }: {
  programs.hyprland.enable = true;

  programs.nm-applet.enable = true;

  environment.systemPackages = with pkgs; [
    # security
    polkit_gnome

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

  security.polkit.enable = true;

  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    description = "polkit-gnome-authentication-agent-1";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };
}

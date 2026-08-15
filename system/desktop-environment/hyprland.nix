{ inputs, pkgs, ... }: {
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  programs.nm-applet.enable = true;

  environment.systemPackages = with pkgs; [
    # wallpaper
    hyprpaper

    # clipboard
    cliphist
    wl-clipboard

    # randr
    wlr-randr
    xrandr

    # misc
    libnotify
    xhost
  ];

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # hint for electron apps
  };
}

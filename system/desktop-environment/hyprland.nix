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
    inputs.awww.packages.${pkgs.stdenv.hostPlatform.system}.awww

    # clipboard
    cliphist
    wl-clipboard

    # misc
    libnotify
  ];

  security.pam.services.swaylock = {};

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # hint for electron apps
  };
}

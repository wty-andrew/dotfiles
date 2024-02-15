{ pkgs, ... }: {
  home.packages = with pkgs; [
    glib
    gsettings-desktop-schemas
    qogir-icon-theme
    numix-icon-theme
  ];

  home.pointerCursor = {
    name = "Qogir";
    package = pkgs.qogir-icon-theme;
    size = 18;
    x11.enable = true;
    gtk.enable = true;
  };
}

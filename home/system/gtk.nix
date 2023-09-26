{ pkgs, ... }: {
  home.packages = with pkgs; [
    glib
    gsettings-desktop-schemas
  ];

  home.pointerCursor = {
    name = "Qogir";
    package = pkgs.qogir-icon-theme;
    size = 18;
    x11.enable = true;
    gtk.enable = true;
  };

  gtk = {
    enable = true;

    theme = {
      name = "Catppuccin-Frappe-Compact-Mauve-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = ["mauve"];
        tweaks = ["rimless"];
        size = "compact";
        variant = "frappe";
      };
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "frappe";
        accent = "mauve";
      };
    };
  };
}

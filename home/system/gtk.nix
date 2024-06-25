{ config, pkgs, ... }: {
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

  gtk =
    let
      flavor = "frappe";
      accent = "mauve";
      size = "compact";
      tweak = "rimless";
    in
    {
      enable = true;

      theme = {
        name = "catppuccin-${flavor}-${accent}-${size}+${tweak}";
        package = pkgs.catppuccin-gtk.override {
          inherit size;
          accents = [ accent ];
          tweaks = [ tweak ];
          variant = flavor;
        };
      };

      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.catppuccin-papirus-folders.override {
          inherit accent flavor;
        };
      };

      gtk2.extraConfig = ''
        gtk-application-prefer-dark-theme = true;
      '';

      gtk3.extraConfig = {
        gtk-application-prefer-dark-theme = 1;
      };

      gtk4.extraConfig = {
        gtk-application-prefer-dark-theme = 1;
      };
    };

  xdg.configFile =
    let
      gtk4Dir = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0";
    in
    {
      "gtk-4.0/assets".source = "${gtk4Dir}/assets";
      "gtk-4.0/gtk.css".source = "${gtk4Dir}/gtk.css";
      "gtk-4.0/gtk-dark.css".source = "${gtk4Dir}/gtk-dark.css";
    };
}

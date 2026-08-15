{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    regreet
  ];

  services.displayManager.regreet = {
    enable = true;

    settings = {
      skip_selection = true;
    };

    theme =
      let
        flavor = "frappe";
        accent = "mauve";
        size = "compact";
        tweak = "rimless";
      in
      {

        name = "catppuccin-${flavor}-${accent}-${size}+${tweak}";
        package = pkgs.catppuccin-gtk.override {
          inherit size;
          accents = [ accent ];
          tweaks = [ tweak ];
          variant = flavor;
        };
      };

    extraCss = ./../../config/regreet/regreet.css;
  };
}

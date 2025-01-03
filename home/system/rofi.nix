{ pkgs, ... }: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
  };

  catppuccin.rofi = {
    enable = true;
    flavor = "frappe";
  };
}

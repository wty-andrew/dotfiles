{ ... }: {
  programs.rofi = {
    enable = true;
  };

  catppuccin.rofi = {
    enable = true;
    flavor = "frappe";
  };
}

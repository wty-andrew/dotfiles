{ pkgs, ... }: {
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      addons = with pkgs; [
        fcitx5-chewing
        fcitx5-gtk
        fcitx5-table-extra
        qt6Packages.fcitx5-chinese-addons
      ];
    };
  };

  catppuccin.fcitx5 = {
    enable = true;
    flavor = "frappe";
    accent = "mauve";
  };
}

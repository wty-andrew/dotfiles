{ pkgs, ... }: {
  i18n.inputMethod = {
    enabled = "fcitx5";

    fcitx5 = {
      addons = with pkgs; [
        fcitx5-chewing
        fcitx5-chinese-addons
        fcitx5-gtk
        fcitx5-table-extra
      ];

      catppuccin = {
        enable = true;
        flavor = "frappe";
      };
    };
  };
}

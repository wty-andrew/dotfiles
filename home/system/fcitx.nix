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

      # TODO: re-enable after https://github.com/catppuccin/nix/pull/343 merged
      # catppuccin = {
      #   enable = true;
      #   flavor = "frappe";
      #   accent = "mauve";
      # };
    };
  };
}

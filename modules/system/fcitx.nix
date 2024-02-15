{ pkgs, ... }: {
  i18n.inputMethod = {
    enabled = "fcitx5";

    fcitx5.addons = with pkgs; [
      fcitx5-chewing
      fcitx5-chinese-addons
      fcitx5-gtk
      fcitx5-table-extra
    ];
  };

  home.file.".local/share/fcitx5/themes/catppuccin".source =
    pkgs.fetchFromGitHub {
      owner = "catppuccin";
      repo = "fcitx5";
      rev = "ce244cfdf43a648d984719fdfd1d60aab09f5c97";
      sha256 = "sha256-uFaCbyrEjv4oiKUzLVFzw+UY54/h7wh2cntqeyYwGps=";
    } + "/src/catppuccin-frappe";
}

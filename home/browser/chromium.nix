{ pkgs, helpers, ... }: {
  programs.chromium.enable = true;

  home.packages = with pkgs; [
    (helpers.patchDesktopEntry chromium "chromium-browser" "^Exec=chromium" "Exec=chromium --enable-wayland-ime")
  ];
}

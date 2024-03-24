{ pkgs, helpers, ... }: {
  home.packages = with pkgs; [
    spotify
    (helpers.patchDesktopEntry spotify "spotify" "^Exec=spotify" "Exec=spotify --enable-wayland-ime")
  ];
}

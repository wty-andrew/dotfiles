{ pkgs, helpers, ... }: {
  home.packages = with pkgs.unstable; [
    spotify
    (helpers.patchDesktopEntry spotify "spotify" "^Exec=spotify" "Exec=spotify --enable-wayland-ime")
  ];
}

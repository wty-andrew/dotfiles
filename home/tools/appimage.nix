{ pkgs, ... }: {
  home.packages = with pkgs; [
    unstable.appimage-run
  ];
}

{ pkgs, ... }: {
  home.packages = with pkgs; [
    keybase
    keybase-gui
    kbfs
  ];
}

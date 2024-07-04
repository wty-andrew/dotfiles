{ pkgs, ... }: {
  home.packages = with pkgs; [
    stlink-gui
  ];
}

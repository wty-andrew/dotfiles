{ pkgs, ... }: {
  home.packages = with pkgs; [
    picotool
  ];
}

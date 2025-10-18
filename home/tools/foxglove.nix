{ pkgs, ... }: {
  home.packages = with pkgs; [
    foxglove-studio
  ];
}

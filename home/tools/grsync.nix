{ pkgs, ... }: {
  home.packages = with pkgs; [
    grsync
  ];
}

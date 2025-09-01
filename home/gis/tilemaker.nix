{ pkgs, ... }: {
  home.packages = with pkgs; [
    tilemaker
  ];
}

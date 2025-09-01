{ pkgs, ... }: {
  home.packages = with pkgs; [
    pmtiles
  ];
}

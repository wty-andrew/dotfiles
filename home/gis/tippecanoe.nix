{ pkgs, ... }: {
  home.packages = with pkgs; [
    tippecanoe
  ];
}

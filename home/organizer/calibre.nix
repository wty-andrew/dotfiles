{ pkgs, ... }: {
  home.packages = with pkgs; [
    stable.calibre
  ];
}

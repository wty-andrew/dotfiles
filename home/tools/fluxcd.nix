{ pkgs, ... }: {
  home.packages = with pkgs; [
    fluxcd
  ];
}

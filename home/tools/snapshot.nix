{ pkgs, ... }: {
  home.packages = with pkgs; [
    snapshot
  ];
}

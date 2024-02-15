{ pkgs, ... }: {
  home.packages = with pkgs; [
    unstable.spotify
  ];
}

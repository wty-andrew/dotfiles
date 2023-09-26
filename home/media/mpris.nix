{ pkgs, ... }: {
  home.packages = with pkgs; [
    mpd-mpris
    playerctl
  ];

  services.mpris-proxy.enable = true;

  services.playerctld.enable = true;
}

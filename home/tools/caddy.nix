{ pkgs, ... }: {
  home.packages = with pkgs; [
    caddy
  ];
}
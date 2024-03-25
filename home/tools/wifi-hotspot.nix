{ pkgs, ... }: {
  home.packages = with pkgs; [
    linux-wifi-hotspot
  ];
}

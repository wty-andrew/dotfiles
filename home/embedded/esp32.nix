{ pkgs, ... }: {
  home.packages = with pkgs; [
    espflash
    espup
    ldproxy
  ];
}

{ pkgs, ... }: {
  home.packages = with pkgs; [
    picocom
  ];
}

{ pkgs, ... }: {
  home.packages = with pkgs; [
    sox
  ];
}

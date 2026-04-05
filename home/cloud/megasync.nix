{ pkgs, ... }: {
  home.packages = with pkgs; [
    megasync
  ];
}

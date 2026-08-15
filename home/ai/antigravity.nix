{ pkgs, ... }: {
  home.packages = with pkgs; [
    antigravity-cli
    antigravity-ide-fhs
  ];
}

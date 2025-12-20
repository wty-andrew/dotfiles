{ pkgs, ... }: {
  home.packages = with pkgs; [
    repomix
  ];
}

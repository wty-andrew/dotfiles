{ pkgs, ... }: {
  home.packages = with pkgs; [
    stable.nyxt
  ];
}

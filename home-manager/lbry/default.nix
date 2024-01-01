{ pkgs, ... }: {
  home.packages = with pkgs; [
    lbry
  ];
}

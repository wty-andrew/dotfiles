{ pkgs, ... }: {
  home.packages = with pkgs; [
    unstable.mendeley
  ];
}

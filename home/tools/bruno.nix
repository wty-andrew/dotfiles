{ pkgs, ... }: {
  home.packages = with pkgs; [
    unstable.bruno
  ];
}

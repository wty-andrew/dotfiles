{ pkgs, ... }: {
  home.packages = with pkgs; [
    v4l-utils
  ];
}

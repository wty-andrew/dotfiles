{ pkgs, ... }: {
  home.packages = with pkgs.unstable; [
    terraform
  ];
}

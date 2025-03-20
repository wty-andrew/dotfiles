{ pkgs, ... }: {
  home.packages = with pkgs; [
    zenoh
  ];
}

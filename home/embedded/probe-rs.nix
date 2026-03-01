{ pkgs, ... }: {
  home.packages = with pkgs; [
    probe-rs-tools
  ];
}

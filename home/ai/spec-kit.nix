{ pkgs, ... }: {
  home.packages = with pkgs; [
    spec-kit
  ];
}

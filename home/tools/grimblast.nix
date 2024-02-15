{ inputs, pkgs, ... }: {
  home.packages = with pkgs; [
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
  ];
}

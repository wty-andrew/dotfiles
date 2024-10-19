{ pkgs, ... }: {
  home.packages = with pkgs; [
    nil
    nixd
    nixpkgs-fmt
    statix
  ];

  xdg.configFile."nixpkgs".source = ../../config/nixpkgs;
}

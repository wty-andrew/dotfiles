{ pkgs, ... }: {
  home.packages = with pkgs; [
    nil
    nixd
    nixfmt
    statix
  ];

  xdg.configFile."nixpkgs".source = ../../config/nixpkgs;
}

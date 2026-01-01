{ pkgs, ... }: {
  home.packages = with pkgs; [
    nil
    nixd
    nixfmt-rfc-style
    statix
  ];

  xdg.configFile."nixpkgs".source = ../../config/nixpkgs;
}

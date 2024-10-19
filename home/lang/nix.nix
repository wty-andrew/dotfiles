{ pkgs, ... }: {
  home.packages = with pkgs; [
    nil
    nixd
    nixpkgs-fmt
  ];

  xdg.configFile."nixpkgs".source = ../../config/nixpkgs;
}

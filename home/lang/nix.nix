{ pkgs, ... }: {
  home.packages = with pkgs; [
    nil
    nixpkgs-fmt
  ];

  xdg.configFile."nixpkgs".source = ../../config/nixpkgs;
}

{ pkgs, ... }: {
  home.packages = with pkgs; [
    openclaw
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "openclaw-2026.3.12"
  ];
}

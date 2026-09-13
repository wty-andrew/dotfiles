{ pkgs, ... }: {
  home.packages = with pkgs; [
    keybase
    keybase-gui
    kbfs
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "keybase-gui-6.5.1"
  ];
}

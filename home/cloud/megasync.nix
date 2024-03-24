{ pkgs, ... }: {
  home.packages = with pkgs; [
    megasync
  ];

  # TODO: check https://github.com/NixOS/nixpkgs/issues/290949
  nixpkgs.config.permittedInsecurePackages = [
    "freeimage-unstable-2021-11-01"
  ];
}

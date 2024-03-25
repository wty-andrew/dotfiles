{ pkgs, ... }: {
  home.packages = with pkgs; [
    # TODO: wait for https://github.com/NixOS/nixpkgs/issues/318943
    # nyxt
  ];
}

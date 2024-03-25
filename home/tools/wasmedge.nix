{ pkgs, ... }: {
  # TODO: add plugins?
  home.packages = with pkgs; [
    wasmedge
  ];
}

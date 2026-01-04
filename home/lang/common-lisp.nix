{ pkgs, ... }: {
  home.packages = with pkgs; [
    # roswell # TODO: broken
    sbcl
  ];
}

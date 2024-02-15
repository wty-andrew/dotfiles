{ pkgs, ... }: {
  home.packages = with pkgs; [
    sbt
    # coursier
    # metals
    # scalafmt
  ];
}

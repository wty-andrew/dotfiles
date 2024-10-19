{ pkgs, ... }: {
  home.packages = with pkgs; [
    mongodb-ce
    mongodb-compass
    mongodb-tools
    mongosh
  ];
}

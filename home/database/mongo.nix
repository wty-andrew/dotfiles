{ pkgs, ... }: {
  home.packages = with pkgs; [
    mongodb
    mongodb-compass
    mongodb-tools
    mongosh
  ];
}

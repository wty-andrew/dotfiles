{ pkgs, ... }: {
  home.packages = with pkgs; [
    mongodb-ce
    stable.mongodb-compass # TODO: latest 1.49.10 broken
    mongodb-tools
    mongosh
  ];
}

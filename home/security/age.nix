{ pkgs, ... }: {
  home.packages = with pkgs; [
    age
    ssh-to-age
  ];
}

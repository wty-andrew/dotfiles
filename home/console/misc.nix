{ pkgs, ... }: {
  home.packages = with pkgs; [
    # modern alternatives
    duf
    fd
    procs
    ripgrep

    # http client
    curl
    httpie
    wget

    # monitoring
    htop
    iftop
    iotop

    # disk usage
    ncdu
    nix-du

    # cheatsheet
    cheat
    tldr

    # archive
    unrar
    unzip
    zip

    # misc
    file
    jq
    just
    neofetch
  ];
}

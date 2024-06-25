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

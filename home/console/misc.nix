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
    btop
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
    fzf
    jq
    just
    neofetch
  ];
}

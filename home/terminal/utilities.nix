{ pkgs, ... }: {
  home.packages = with pkgs; [
    # modern alternatives
    duf
    fd
    lsd
    procs
    ripgrep

    # http client
    curl
    httpie
    wget

    # monitoring
    htop
    btop
    iotop
    iftop

    # cheatsheet
    cheat
    tldr

    # archive
    zip
    unzip
    unrar

    # misc
    jq
    just
    fzf
    neofetch
  ];
}

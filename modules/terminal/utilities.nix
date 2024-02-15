{ pkgs, ... }: {
  home.packages = with pkgs; [
    # modern alternatives
    bat
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

    # misc
    jq
    fzf
    neofetch
  ];
}

{ pkgs, ... }: {
  home.packages = with pkgs; [
    clang-tools
    cmake
    gcc
    gdb
    gnumake
    xmake
  ];
}

{ pkgs, ... }: {
  home.packages = with pkgs; [
    clang-tools_17
    cmake
    gcc
    gdb
    gnumake
    xmake
  ];
}

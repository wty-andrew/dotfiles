{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    rustup
    sccache
    wasm-pack
  ];

  home.sessionPath = [
    "${config.home.homeDirectory}/.cargo/bin"
  ];
}

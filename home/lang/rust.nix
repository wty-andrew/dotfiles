{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    rustup
    wasm-pack
  ];

  home.sessionPath = [
    "${config.home.homeDirectory}/.cargo/bin"
  ];
}

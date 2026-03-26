{ ... }: {
  imports = [
    ./esp32.nix
    ./pico.nix
    ./platformio.nix
    ./probe-rs.nix
    ./stlink.nix
  ];
}

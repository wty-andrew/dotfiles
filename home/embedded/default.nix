{ ... }: {
  imports = [
    ./esp32.nix
    ./pico.nix
    ./picocom.nix
    ./platformio.nix
    ./probe-rs.nix
    ./stlink.nix
  ];
}

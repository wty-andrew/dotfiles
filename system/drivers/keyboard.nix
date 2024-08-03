{ ... }: {
  # TODO: make it configurable
  boot.extraModprobeConfig = ''
    options hid_apple fnmode=0
  '';
}

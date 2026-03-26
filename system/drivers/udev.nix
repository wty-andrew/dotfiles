{ pkgs, ... }: {
  services.udev.packages = with pkgs; [
    openocd
    platformio-core
    stlink
  ];

  # copied from https://github.com/raspberrypi/picotool/blob/master/udev/60-picotool.rules, better
  # to have picotool derivation to install the rules
  services.udev.extraRules = ''
SUBSYSTEM=="usb", \
    ATTRS{idVendor}=="2e8a", \
    ATTRS{idProduct}=="0003", \
    TAG+="uaccess", \
    MODE="660", \
    GROUP="plugdev"
SUBSYSTEM=="usb", \
    ATTRS{idVendor}=="2e8a", \
    ATTRS{idProduct}=="0009", \
    TAG+="uaccess", \
    MODE="660", \
    GROUP="plugdev"
SUBSYSTEM=="usb", \
    ATTRS{idVendor}=="2e8a", \
    ATTRS{idProduct}=="000a", \
    TAG+="uaccess", \
    MODE="660", \
    GROUP="plugdev"
SUBSYSTEM=="usb", \
    ATTRS{idVendor}=="2e8a", \
    ATTRS{idProduct}=="000f", \
    TAG+="uaccess", \
    MODE="660", \
    GROUP="plugdev"
  '';
}

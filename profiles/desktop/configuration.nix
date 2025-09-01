{ pkgs, ... }: {
  imports =
    [
      ./hardware-configuration.nix

      ../base/configuration.nix

      ../../system/desktop-environment/gdm.nix
      ../../system/desktop-environment/hyprland.nix
      ../../system/desktop-environment/kanata.nix
      ../../system/desktop-environment/locale.nix
      ../../system/desktop-environment/polkit.nix
      ../../system/desktop-environment/thunar.nix
      ../../system/desktop-environment/zsh.nix

      ../../system/drivers/audio.nix
      ../../system/drivers/bluetooth.nix
      ../../system/drivers/controller.nix
      ../../system/drivers/graphics.nix
      ../../system/drivers/nvidia.nix
      ../../system/drivers/piper.nix
      ../../system/drivers/tablet.nix
      ../../system/drivers/udev.nix
      ../../system/drivers/usb.nix
      ../../system/drivers/utilities.nix

      ../../system/services/avahi.nix
      ../../system/services/flatpak.nix
      ../../system/services/locate.nix
      ../../system/services/ollama.nix
      ../../system/services/ssh.nix

      ../../system/virtualisation/docker.nix
      ../../system/virtualisation/podman.nix

      ./certs.nix
      ./dns.nix
      ./firewall.nix
      ./secrets.nix
    ];

  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];

  hardware.nvidia = {
    open = false;

    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };

      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  # https://github.com/NixOS/nixpkgs/issues/421775
  services.ollama = {
    package = pkgs.ollama.override {
      cudaArches = [ "61" ];
    };
  };
}

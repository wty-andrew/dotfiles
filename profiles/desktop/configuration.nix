{ username, ... }: {
  imports =
    [
      ./hardware-configuration.nix

      ../base/configuration.nix

      ../../system/desktop-environment/hyprland.nix
      ../../system/desktop-environment/kanata.nix
      ../../system/desktop-environment/locale.nix
      ../../system/desktop-environment/polkit.nix
      ../../system/desktop-environment/regreet.nix
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
      ../../system/services/vpn.nix

      ../../system/virtualisation/docker.nix
      ../../system/virtualisation/podman.nix
      ../../system/virtualisation/virtual-machine.nix

      ./certs.nix
      ./dns.nix
      ./firewall.nix
      ./secrets.nix
    ];

  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];

  programs.gamemode.enable = true;

  users.users.${username}.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC/F/n3+57DKfSMMZRC2/gT8iIIhxqMZ4idohhhbOSiq wty.andrew@gmail.com"
  ];
}

{ config, pkgs, username, hostname, ... }: {
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix

      ../base/configuration.nix

      ../../system/desktop-environment/fonts.nix
      ../../system/desktop-environment/gdm.nix
      ../../system/desktop-environment/hyprland.nix
      ../../system/desktop-environment/locale.nix
      ../../system/desktop-environment/thunar.nix
      ../../system/desktop-environment/zsh.nix

      ../../system/drivers/audio.nix
      ../../system/drivers/battery.nix
      ../../system/drivers/brightnessctl.nix
      ../../system/drivers/bluetooth.nix
      ../../system/drivers/nvidia.nix
      ../../system/drivers/opengl.nix
      ../../system/drivers/tablet.nix
      ../../system/drivers/usb.nix
      ../../system/drivers/utilities.nix

      ../../system/services/flatpak.nix
      ../../system/services/ssh.nix

      ../../system/virtualisation/docker.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  users.users.${username}.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILIuynSO6FWcjrDPEgP3no4xvueymGvITC++JImPOGbh wty.andrew@gmail.com"
  ];

  services.openssh = {
    enable = true;

    settings = {
      PasswordAuthentication = false;
    };
  };
}

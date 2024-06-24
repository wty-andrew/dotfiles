{ username, ... }: {
  imports =
    [
      ./hardware-configuration.nix

      ../base/configuration.nix

      ../../system/desktop-environment/gdm.nix
      ../../system/desktop-environment/hyprland.nix
      ../../system/desktop-environment/locale.nix
      ../../system/desktop-environment/polkit.nix
      ../../system/desktop-environment/thunar.nix
      ../../system/desktop-environment/zsh.nix

      ../../system/drivers/audio.nix
      ../../system/drivers/battery.nix
      ../../system/drivers/brightnessctl.nix
      ../../system/drivers/bluetooth.nix
      ../../system/drivers/graphics.nix
      ../../system/drivers/nvidia.nix
      ../../system/drivers/tablet.nix
      ../../system/drivers/usb.nix
      ../../system/drivers/utilities.nix

      ../../system/services/flatpak.nix
      ../../system/services/locate.nix
      ../../system/services/ollama.nix
      ../../system/services/ssh.nix

      ../../system/virtualisation/docker.nix
      ../../system/virtualisation/podman.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  hardware.nvidia = {
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };

      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

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

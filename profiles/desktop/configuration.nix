{ ... }: {
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

  boot.loader = {
    efi.canTouchEfiVariables = true;

    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
    };
  };
}

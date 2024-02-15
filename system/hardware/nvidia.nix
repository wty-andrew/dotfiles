{ config, pkgs, ... }: {
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  hardware.opengl.extraPackages = [ pkgs.nvidia-vaapi-driver ];

  services.xserver.videoDrivers = [ "nvidia" ];

  virtualisation.docker.enableNvidia = true;

  environment.systemPackages = [ pkgs.cudaPackages.cudatoolkit ];

  # TODO: can be removed?
  programs.hyprland.enableNvidiaPatches = true;
}

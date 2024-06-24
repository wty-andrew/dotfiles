{ config, pkgs, ... }: {
  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
  };
  hardware.nvidia-container-toolkit.enable = true;

  hardware.graphics.extraPackages = [ pkgs.nvidia-vaapi-driver ];

  services.xserver.videoDrivers = [ "nvidia" ];

  environment.systemPackages = [ pkgs.cudaPackages.cudatoolkit ];
}

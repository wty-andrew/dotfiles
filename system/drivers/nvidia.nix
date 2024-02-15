{ config, pkgs, ... }: {
  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
  };

  hardware.opengl.extraPackages = [ pkgs.nvidia-vaapi-driver ];

  services.xserver.videoDrivers = [ "nvidia" ];

  virtualisation.docker.enableNvidia = true;

  environment.systemPackages = [ pkgs.cudaPackages.cudatoolkit ];
}

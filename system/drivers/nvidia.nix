{ config, pkgs, ... }: {
  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.latest;
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    nvidiaSettings = true;
  };
  hardware.nvidia-container-toolkit = {
    enable = true;

    # https://github.com/NixOS/nixpkgs/issues/383085
    mounts = [
      {
        hostPath = "${pkgs.addDriverRunpath.driverLink}/share/vulkan/icd.d";
        containerPath = "/etc/vulkan/icd.d";
      }
    ];
  };

  hardware.graphics.extraPackages = [ pkgs.nvidia-vaapi-driver ];

  services.xserver.videoDrivers = [ "nvidia" ];

  environment.systemPackages = [ pkgs.cudaPackages.cudatoolkit ];
}

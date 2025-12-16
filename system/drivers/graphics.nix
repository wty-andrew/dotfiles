{ pkgs, ... }: {
  hardware.graphics = {
    enable = true;
    enable32Bit = true;

    package = pkgs.mesa;
    package32 = pkgs.pkgsi686Linux.mesa;

    extraPackages = with pkgs; [
      intel-media-driver
      intel-vaapi-driver
      libva-vdpau-driver
      libvdpau-va-gl
    ];
  };

  environment.systemPackages = with pkgs; [
    libva-utils
    mesa-demos
    vulkan-tools
  ];
}

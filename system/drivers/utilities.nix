{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    lshw
    pciutils
  ];
}

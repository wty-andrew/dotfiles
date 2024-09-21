{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    lshw
    inetutils
    pciutils
    wev
  ];
}

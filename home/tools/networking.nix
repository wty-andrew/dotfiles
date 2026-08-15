{ pkgs, ... }: {
  home.packages = with pkgs; [
    arp-scan
    caddy
    linux-wifi-hotspot
    net-tools
    nmap
  ];
}

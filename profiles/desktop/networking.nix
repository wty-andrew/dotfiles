_: {
  # bridge network for virtual machine (virt-manager)
  # https://discourse.nixos.org/t/network-bridge-with-static-ip-on-host/15580/3
  networking.useDHCP = false;
  networking.bridges."br0".interfaces = [ "enp5s0" ];
  networking.interfaces.br0.useDHCP = false;
  networking.interfaces.br0.ipv4.addresses = [{
    address = "192.168.0.50";
    prefixLength = 24;
  }];
}

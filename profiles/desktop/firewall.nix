_: {
  networking = {
    firewall = {
      enable = true;
      allowedTCPPorts = [
        80   # http
        443  # https
        6443 # k3s
        3000 # web development
        8000 # web development
        7447 # zenoh
      ];

      extraInputRules = ''
        ip daddr 224.0.0.0/4 udp dport 0-65535 accept
        ip saddr 224.0.0.0/4 udp sport 0-65535 accept
      '';
    };

    nftables.enable = true;
  };
}

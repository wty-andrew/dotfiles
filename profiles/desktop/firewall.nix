_: {
  networking = {
    firewall = {
      enable = true;
      allowedTCPPorts = [ 80 443 ];

      extraInputRules = ''
        ip daddr 224.0.0.0/4 udp dport 0-65535 accept
        ip saddr 224.0.0.0/4 udp sport 0-65535 accept
      '';
    };

    nftables.enable = true;
  };
}

{ config, ... }: {
  sops.secrets.zone = {
    mode = "0644";
    owner = "named";
    group = "named";
    format = "binary";
    sopsFile = ./secrets/home.lab.zone;
    restartUnits = [ "bind.service" ];
  };

  services.bind = {
    enable = true;
    forwarders = [
      "1.1.1.1"
      "8.8.8.8"
    ];
    zones = {
      "home.lab" = {
        master = true;
        file = config.sops.secrets.zone.path;
      };
    };
  };
}

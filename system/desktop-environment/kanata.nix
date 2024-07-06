{ username, pkgs, ... }: {
  services.kanata = {
    enable = true;
    package = pkgs.kanata-with-cmd;
    keyboards = {
      default = {
        configFile = ../../config/kanata/default.kbd;
      };
    };
  };

  users.users.${username}.extraGroups = [ "input" "uinput" ];
}

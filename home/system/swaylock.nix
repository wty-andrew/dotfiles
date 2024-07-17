{ pkgs, ... }: {
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
  };

  xdg.configFile."swaylock/config".source = ../../config/swaylock/config;
}

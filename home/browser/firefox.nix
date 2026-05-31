{ inputs, pkgs, config, ... }: {
  programs.firefox = {
    enable = true;
    package = inputs.firefox.packages.${pkgs.stdenv.hostPlatform.system}.firefox-nightly-bin;

    # this is new default for home.stateVersion 26.05
    configPath = "${config.xdg.configHome}/mozilla/firefox";
  };
}

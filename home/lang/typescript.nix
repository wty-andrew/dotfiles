{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    nodejs_20
    nodejs_20.pkgs.pnpm
    bun
    yarn-berry
  ];

  home.sessionVariables = {
    PNPM_HOME = "${config.xdg.dataHome}/pnpm";
  };

  home.sessionPath = [
    "${config.xdg.dataHome}/pnpm"
  ];
}

{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    nodejs_22
    nodejs_22.pkgs.pnpm
    biome
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

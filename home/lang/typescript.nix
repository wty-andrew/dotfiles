{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    nodejs_24
    pnpm
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

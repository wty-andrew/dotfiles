{ pkgs, ... }: {
  home.packages = with pkgs; [
    mission-planner
  ];
}

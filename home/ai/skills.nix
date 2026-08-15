{ pkgs, ... }: {
  home.packages = with pkgs; [
    llm-agents.skills
  ];
}

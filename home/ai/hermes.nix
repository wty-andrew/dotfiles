{ pkgs, ... }: {
  home.packages = with pkgs; [
    llm-agents.hermes-agent
    llm-agents.hermes-desktop
  ];
}

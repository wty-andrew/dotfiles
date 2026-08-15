{ config, pkgs, helpers, ... }: {
  home.packages = with pkgs; [
    llm-agents.claude-code
    llm-agents.claude-desktop
  ];

  home.file.".claude".source = config.lib.file.mkOutOfStoreSymlink (helpers.runtimePath ../../config/claude);
}

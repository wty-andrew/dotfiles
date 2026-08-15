{ config, pkgs, helpers, ... }: {
  home.packages = with pkgs; [
    llm-agents.codex
  ];

  home.file.".codex".source = config.lib.file.mkOutOfStoreSymlink (helpers.runtimePath ../../config/codex);
}

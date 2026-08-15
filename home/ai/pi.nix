{ config, pkgs, helpers, ... }: {
  home.packages = with pkgs; [
    llm-agents.pi
  ];

  home.file.".pi".source = config.lib.file.mkOutOfStoreSymlink (helpers.runtimePath ../../config/pi);
}

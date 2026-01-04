{ pkgs, ... }: {
  programs.thunar = {
    enable = true;

    plugins = with pkgs; [
      thunar-archive-plugin
      thunar-volman
    ];
  };

  services.tumbler.enable = true; # thumbnail

  environment.systemPackages = with pkgs; [
    engrampa # file archiver
  ];
}

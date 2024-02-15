{ pkgs, ... }: {
  programs.thunar = {
    enable = true;

    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
  };

  services.tumbler.enable = true; # thumbnail

  environment.systemPackages = with pkgs; [
    mate.engrampa # file archiver
  ];
}

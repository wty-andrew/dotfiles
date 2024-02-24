{ pkgs, ... }: {
  home.packages = with pkgs; [
    lsd
  ];

  programs.zsh.shellAliases = {
    ls = "lsd --group-directories-first";
    l = "ls -l";
    la = "ls -a";
    lla = "ls -la";
    lt = "ls --tree";
  };
}

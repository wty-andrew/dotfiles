{ pkgs, ... }: {
  home.packages = with pkgs; [
    dive
    lazydocker
  ];

  xdg.configFile."lazydocker".source = ../../config/lazydocker;

  programs.zsh.shellAliases = {
    lzd = "lazydocker";
  };
}

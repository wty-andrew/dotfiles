{ pkgs, ... }: {
  programs.bat = {
    enable = true;

    extraPackages = with pkgs.bat-extras; [ batdiff batman batgrep batwatch ];
  };

  catppuccin.bat = {
    enable = true;
    flavor = "frappe";
  };

  programs.zsh.shellAliases = {
    cat = "bat";
  };
}

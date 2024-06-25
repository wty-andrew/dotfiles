{ pkgs, ... }: {
  programs.bat = {
    enable = true;

    extraPackages = with pkgs.bat-extras; [ batdiff batman batgrep batwatch ];

    catppuccin = {
      enable = true;
      flavor = "frappe";
    };
  };

  programs.zsh.shellAliases = {
    cat = "bat";
  };
}

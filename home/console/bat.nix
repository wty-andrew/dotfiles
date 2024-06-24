{ pkgs, ... }: {
  programs.bat = {
    enable = true;

    extraPackages = with pkgs.bat-extras; [ batdiff batman batgrep batwatch ];

    themes = {
      frappe = {
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "bat";
          rev = "d714cc1d358ea51bfc02550dabab693f70cccea0";
          sha256 = "Q5B4NDrfCIK3UAMs94vdXnR42k4AXCqZz6sRn8bzmf4=";
        };
        file = "themes/Catppuccin Frappe.tmTheme";
      };
    };

    config = {
      theme = "frappe";
    };
  };

  programs.zsh.shellAliases = {
    cat = "bat";
  };
}

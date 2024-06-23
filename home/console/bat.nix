{ pkgs, ... }: {
  programs.bat = {
    enable = true;

    extraPackages = with pkgs.bat-extras; [ batdiff batman batgrep batwatch ];

    themes = {
      frappe = {
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "bat";
          rev = "ba4d16880d63e656acced2b7d4e034e4a93f74b1";
          sha256 = "6WVKQErGdaqb++oaXnY3i6/GuH2FhTgK0v4TN4Y0Wbw=";
        };
        file = "Catppuccin-frappe.tmTheme";
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

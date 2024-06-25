{ ... }: {
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[○](bold red)";
      };
      format = "$all";
      gcloud.disabled = true;
    };

    catppuccin = {
      enable = true;
      flavor = "frappe";
    };
  };
}

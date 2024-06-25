{ pkgs, ... }: {
  programs.tmux = {
    enable = true;

    prefix = "C-a";
    mouse = true;
    baseIndex = 1;
    escapeTime = 0;
    historyLimit = 5000;
    terminal = "tmux-256color";

    catppuccin = {
      enable = true;
      flavor = "frappe";
      extraConfig = ''
        set -g @catppuccin_window_default_text "#W"
        set -g @catppuccin_window_current_text "#W"
        set -g @catppuccin_status_modules_right "directory session"
        set -g @catppuccin_directory_text "#{pane_current_path}"
      '';
    };

    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      yank
    ];

    extraConfig = ''
      # Color
      set -sg terminal-overrides ",*:RGB"

      # Keybindings

      unbind %
      unbind '"'
      bind | split-window -h
      bind - split-window -v

      bind -n M-] next-window
      bind -n M-[ previous-window
      bind -n C-Tab next-window
      bind -n C-S-Tab previous-window

      bind -r H resize-pane -L 3
      bind -r J resize-pane -D 3
      bind -r K resize-pane -U 3
      bind -r L resize-pane -R 3

      # vi mode
      set-window-option -g mode-keys vi
      bind-key -T copy-mode-vi v send -X begin-selection
    '';
  };
}

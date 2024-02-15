{ pkgs, ... }: {
  programs.tmux = {
    enable = true;

    prefix = "C-a";
    mouse = true;
    baseIndex = 1;
    escapeTime = 0;
    historyLimit = 5000;
    terminal = "tmux-256color";

    plugins = with pkgs.tmuxPlugins; [
      {
        plugin = catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavour 'frappe'
          set -g @catppuccin_window_default_text "#W"
          set -g @catppuccin_window_current_text "#W"
          set -g @catppuccin_status_modules_right "directory session"
          set -g @catppuccin_directory_text "#{pane_current_path}"
        '';
      }
      vim-tmux-navigator
      yank
    ];

    extraConfig = ''
      # Color
      set -sg terminal-overrides ",*:RGB"

      # Window spliting
      unbind %
      unbind '"'
      bind | split-window -h
      bind - split-window -v

      # Window navigation
      bind -n M-H previous-window
      bind -n M-L next-window

      # Resizing panes
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

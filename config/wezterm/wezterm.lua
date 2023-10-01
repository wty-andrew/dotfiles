local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.font = wezterm.font_with_fallback {
  'FiraCode Nerd Font Mono',
  'Noto Sans Mono CJK TC'
}
config.font_size = 12;
config.color_scheme = 'Catppuccin Frappe'

config.window_background_opacity = 0.9

config.use_ime = true;

return config

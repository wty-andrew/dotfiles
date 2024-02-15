local wezterm = require 'wezterm'
local act = wezterm.action
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.font = wezterm.font_with_fallback {
  'FiraCode Nerd Font Mono',
  'Noto Sans Mono CJK TC'
}
config.font_size = 14
config.color_scheme = 'Catppuccin Frappe'
config.window_background_opacity = 0.95
config.window_padding = {
  left = '2cell',
  right = '2cell',
  top = '1cell',
  bottom = '1cell',
}
config.hide_mouse_cursor_when_typing = true
config.hide_tab_bar_if_only_one_tab = true

config.use_ime = true
config.enable_wayland = false
config.dpi = 96.0

config.leader = { key = 'Space', mods = 'CTRL|SHIFT', timeout_milliseconds = 1000 }
config.keys = {
  { key = 'K', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Up' },
  { key = 'J', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Down' },
  { key = 'H', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Left' },
  { key = 'L', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Right' },
  { key = 'K', mods = 'CTRL|SHIFT|ALT', action = act.AdjustPaneSize { 'Up', 1 } },
  { key = 'J', mods = 'CTRL|SHIFT|ALT', action = act.AdjustPaneSize { 'Down', 1 } },
  { key = 'H', mods = 'CTRL|SHIFT|ALT', action = act.AdjustPaneSize { 'Left', 1 } },
  { key = 'L', mods = 'CTRL|SHIFT|ALT', action = act.AdjustPaneSize { 'Right', 1 } },
  { key = '{', mods = 'CTRL|SHIFT', action = act.ActivateTabRelative(-1) },
  { key = '}', mods = 'CTRL|SHIFT', action = act.ActivateTabRelative(1) },
  { key = '|', mods = 'CTRL|SHIFT', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = '_', mods = 'CTRL|SHIFT', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = '~', mods = 'CTRL|SHIFT', action = act.SpawnTab 'CurrentPaneDomain' },
  { key = ':', mods = 'CTRL|SHIFT', action = act.ShowDebugOverlay },
  { key = '?', mods = 'CTRL|SHIFT', action = act.Search 'CurrentSelectionOrEmptyString' },
}

return config

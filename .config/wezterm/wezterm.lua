local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.front_end = 'WebGpu'

-- config.font = wezterm.font("DejaVu Sans Mono")
config.font = wezterm.font 'Hack'
-- config.font = wezterm.font("Fira Code")
config.font_size = 17

config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.color_scheme = 'Moonfly (Gogh)'
config.colors = {
  tab_bar = {
    background = 'rgba(0,0,0,0)',
    active_tab = {
      bg_color = 'rgba(0,0,0,0)',
      fg_color = '#E60026',
    },
    inactive_tab = {
      bg_color = 'rgba(0,0,0,0)',
      fg_color = '#58111A',
    },
    inactive_tab_hover = {
      bg_color = 'rgba(0,0,0,0)',
      fg_color = '#58111A',
    },
    new_tab = {
      bg_color = 'rgba(0,0,0,0)',
      fg_color = '#58111A',
    },
    new_tab_hover = {
      bg_color = 'rgba(0,0,0,0)',
      fg_color = '#58111A',
    },
  },
}

config.background = {
  -- Lowest layer
  -- has a 1 px gap (small but really annoying)
  {
    source = {
      Color = '#000000',
    },
    width = '100%',
    height = '100%',
    opacity = 0.8,
  },
  -- Highest layer
}

return config

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
  {
    source = {
      -- ff 6 from cafe (first luna render)
      -- ff 9, ff 10 from cafe (luna drinking hot choc)
      -- ff 23 from cafe (held hands :D)
      -- fw 13 from werewolf
      -- fl 62 from the barn :(
      -- fl 67 from the barn
      File = '/home/luna/Pictures/wallpapers/somewhere.jpeg',
    },
    vertical_align = 'Middle',
    horizontal_align = 'Center',
  },
  -- has a 1 px gap (small but really annoying)
  {
    source = {
      Color = '#000000',
    },
    width = '20',
    height = '20',
    opacity = 0.99,
  },
  -- Highest layer
}

return config

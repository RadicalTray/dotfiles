local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.front_end = 'WebGpu'

-- config.font = wezterm.font("DejaVu Sans Mono")
config.font = wezterm.font 'Hack'
-- config.font = wezterm.font("Fira Code")
config.font_size = 16

config.enable_tab_bar = false

config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.tab_max_width = 32

-- local custom_theme = wezterm.color.get_builtin_schemes()['carbonfox']
-- local theme_tab_bar = custom_theme.tab_bar
-- theme_tab_bar.background = 'none'
-- for _, key in ipairs { 'active_tab', 'inactive_tab' } do
--   theme_tab_bar[key].bg_color = 'none'
-- end
--
-- config.color_schemes = {
--   ['carbonfox transparent'] = custom_theme,
-- }

config.color_scheme = 'carbonfox'
config.colors = {
  tab_bar = {
    background = 'none',
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

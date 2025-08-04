-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- changing the font-Family and font-Size:
config.font_size = 18
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Regular" })

-- changing the decorations of the window:
config.window_decorations = "RESIZE"
-- optional: you can also tweak padding if needed
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- Changing the Tab bar setting:
config.enable_tab_bar = true

-- For example, changing the color scheme:
config.color_scheme = "Batman"

-- For changing opacity of the window and blur of the window:
config.window_background_opacity = 1.0
config.macos_window_background_blur = 0

-- Avoid true fullscreen (macOS-style zoom)
config.native_macos_fullscreen_mode = false

-- Large initial size to simulate "fill screen"
config.initial_rows = 60
config.initial_cols = 160

-- Auto-reloading the config file
config.automatically_reload_config = true

-- Tab bar configuration
config.enable_tab_bar = true

--Configuration for closing promt
config.window_close_confirmation = "NeverPrompt"

-- and finally, return the configuration to wezterm
return config

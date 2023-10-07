local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.default_prog = { '/usr/local/bin/fish', '-l' }

local tab_colors =
{
	['Tokyo Night'] = {
		background = '#353B56',
		foreground = '#C0CAf5',
		active     = '#1A1B26',
		inactive   = '#1F2335',
	},
	['Tokyo Night Day'] = {
		background = '#BBC2CF',
		foreground = '#387068',
		active     = '#E1E2E7',
		inactive   = '#D1D4DB',
	},
	['Solarized Dark (Gogh)'] = {
		background = '#173541',
		foreground = '#869396',
		active     = '#0E2A35',
		inactive   = '#173541',
	},
	['Solarized Light (Gogh)'] = {
		background = '#EDE8D7',
		foreground = '#697A82',
		active     = '#FCF6E5',
		inactive   = '#EDE8D7',
	},
	-- TODO: Add more colors for favorite color schemes
}

local function get_appearance()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end

	return 'Dark'
end

local function scheme_for_appearance(appearance)
	if appearance:find 'Dark' then
		return 'Solarized Dark (Gogh)'
	else
		return 'Solarized Light (Gogh)'
	end
end

config.color_scheme = scheme_for_appearance(get_appearance())
config.font = wezterm.font_with_fallback({
	'Fantasque Sans Mono',
	{ family = 'FantasqueSansM Nerd Font', scale = 0.64 }
})

config.font_size = 16.0

config.window_decorations = "MACOS_FORCE_DISABLE_SHADOW | INTEGRATED_BUTTONS | RESIZE"

if tab_colors[config.color_scheme] ~= nil then
	config.window_frame = {
		active_titlebar_bg = tab_colors[config.color_scheme].background,
		inactive_titlebar_bg = tab_colors[config.color_scheme].inactive,
	}

	config.colors = {
		tab_bar = {
			active_tab = {
				bg_color = tab_colors[config.color_scheme].active,
				fg_color = tab_colors[config.color_scheme].foreground,
			},
			inactive_tab = {
				bg_color = tab_colors[config.color_scheme].inactive,
				fg_color = tab_colors[config.color_scheme].foreground,
			},
			inactive_tab_hover = {
				bg_color = tab_colors[config.color_scheme].active,
				fg_color = tab_colors[config.color_scheme].foreground,
				italic = true,
			},
			inactive_tab_edge = tab_colors[config.color_scheme].inactive,
			new_tab = {
				bg_color = tab_colors[config.color_scheme].background,
				fg_color = tab_colors[config.color_scheme].foreground,
			},
			new_tab_hover = {
				bg_color = tab_colors[config.color_scheme].background,
				fg_color = tab_colors[config.color_scheme].active,
				italic = true,
			},
		}
	}
end

-- and finally, return the configuration to wezterm
return config

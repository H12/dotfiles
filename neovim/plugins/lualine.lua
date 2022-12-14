local gps = require('nvim-gps')

gps.setup()

require('lualine').setup({
	options = {
		theme = 'tokyonight'
	},
	sections = {
		lualine_a = {},
		lualine_b = { 'branch' },
		lualine_c = {
			'diff',
			'filename',
			{ gps.get_location, cond = gps.is_available },
			{ 'diagnostics', sources = { 'nvim_diagnostic' } }
		},
		lualine_x = { 'encoding', 'filetype' },
		lualine_y = { 'progress', 'location' },
		lualine_z = {}
	}
})

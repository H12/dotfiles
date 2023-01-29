require('lualine').setup({
	options = {
		theme = 'gruvbox-material'
	},
	sections = {
		lualine_a = {},
		lualine_b = { 'branch' },
		lualine_c = {
			'diff',
			'filename',
			{ 'diagnostics', sources = { 'nvim_diagnostic' } }
		},
		lualine_x = { 'encoding', 'filetype' },
		lualine_y = { 'progress', 'location' },
		lualine_z = {}
	}
})

require('lualine').setup({
	options = {
		theme = 'gruvbox-material'
	},
	sections = {
		lualine_a = {},
		lualine_b = {'branch'},
		lualine_c = {
			'filename',
			'diff',
			{'diagnostics', sources={'nvim_lsp'}}
		},
		lualine_x = {'encoding', 'filetype'},
		lualine_y = {'progress', 'location'},
		lualine_z = {}
	}

})

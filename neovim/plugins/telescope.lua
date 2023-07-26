vim.api.nvim_set_keymap('n',
	'<C-p>',
	':Telescope find_files<cr>',
	{ noremap = true, silent = true })

vim.api.nvim_set_keymap('n',
	'<C-f>',
	':Telescope live_grep<cr>',
	{ noremap = true, silent = true })

vim.api.nvim_set_keymap('n',
	'<C-g>',
	':Telescope grep_string<cr>',
	{ noremap = true, silent = true })

vim.api.nvim_set_keymap('n',
	'<C-y>',
	':Telescope oldfiles<cr>',
	{ noremap = true, silent = true })

vim.api.nvim_set_keymap('v',
	'<C-g>',
	':zy<cmd>exec \'Telescope grep_string default_text=\' . escape(@z, \' \')<cr>',
	{ noremap = true, silent = true })

vim.api.nvim_set_keymap('n',
	'<C-b>',
	':Telescope file_browser grouped=true<cr>',
	{ noremap = true, silent = true })

return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.2',
	dependencies = { 'nvim-lua/plenary.nvim' },
	file_browser = {
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
	},
	opts = {
		defaults = {
			layout_strategy = "flex",
			layout_config = {
				flex = {
					flip_columns = 160,
					horizontal = {
						preview_width = 0.58,
					},
				},
			},
		},
		extensions = {
			file_browser = {
				theme = "ivy",
				hijack_netrw = true,
			},
		}
	},
	config = function(_, opts)
		require("telescope").setup(opts)
		require("telescope").load_extension("file_browser")
	end
}

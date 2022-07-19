-- Telescope deps and config
vim.cmd('hi link TelescopeBorder White')

vim.api.nvim_set_keymap('n',
	'<C-p>',
	':Telescope find_files find_command=ag,-l,--hidden<cr>',
	{ noremap = true, silent = true })

vim.api.nvim_set_keymap('n',
	'<C-f>',
	':Telescope live_grep<cr>',
	{ noremap = true, silent = true })

require('telescope').setup({
	defaults = {
		layout_strategy = 'flex',
		layout_config = {
			flex = {
				flip_columns = 160,
				horizontal = {
					preview_width = 0.58,
				},
			},
		},
		vimgrep_arguments = {
			'ag',
			'--hidden',
			'--vimgrep',
		},
	},
})

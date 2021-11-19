-- Telescope deps and config
vim.api.nvim_set_keymap('n',
	'<C-p>',
	':Telescope find_files find_command=ag,-l<cr>',
	{ noremap = true, silent = true })

vim.api.nvim_set_keymap('n',
	'<C-f>',
	':Telescope live_grep find_command=ag,--vimgrep<cr>',
	{ noremap = true, silent = true })

require('telescope').setup({
	defaults = {
		file_sorter =  require'telescope.sorters'.get_fzy_sorter,
		vimgrep_arguments = {
			'rg',
			'--color=never',
			'--no-heading',
			'--with-filename',
			'--line-number',
			'--column',
			'--smart-case',
			'--hidden'
		},
		layout_strategy = 'flex',
		layout_config = {
			flex = {
				flip_columns = 160,
				horizontal = {
					preview_width = 0.58,
				},
			},
		},
	},
})

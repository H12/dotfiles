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

vim.api.nvim_set_keymap('n',
	'<C-g>',
	':Telescope grep_string<cr>',
	{ noremap = true, silent = true })

vim.api.nvim_set_keymap('v',
	'<C-g>',
	'"zy<cmd>exec \'Telescope grep_string default_text=\' . escape(@z, \' \')<cr>',
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
	},
	extensions = {
		fzf = {
			fuzzy = true,                    -- false will only do exact matching
			override_generic_sorter = true,  -- override the generic sorter
			override_file_sorter = true,     -- override the file sorter
			case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		}
	}
})

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

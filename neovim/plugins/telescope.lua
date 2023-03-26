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
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = 'smart_case', -- or 'ignore_case' or 'respect_case'
			-- the default case_mode is 'smart_case'
		},
		file_browser = {
			theme = 'ivy',
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
			mappings = {
				['i'] = {
					-- your custom insert mode mappings
				},
				['n'] = {
					-- your custom normal mode mappings
				},
			},
		},
		['ui-select'] = {
			require('telescope.themes').get_dropdown({})
		}
	}
})

require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')
require('telescope').load_extension('ui-select')

vim.cmd("let g:rnvimr_enable_ex = 1")
vim.cmd("let g:rnvimr_enable_picker = 1")
vim.cmd("let g:rnvimr_hide_gitignore = 1")

vim.cmd("let g:rnvimr_presets = [{'width': 0.800, 'height': 0.850, 'row': 0.050}]")

vim.api.nvim_set_keymap('n',
	'<C-b>',
	':RnvimrToggle<CR>',
	{ noremap = true, silent = true })

vim.api.nvim_set_keymap('t',
	'<C-b>',
	'<C-\\><C-n>:RnvimrToggle<CR>',
	{ noremap = true, silent = true })

vim.api.nvim_set_keymap('t',
	'<ESC>',
	'<C-\\><C-n>:RnvimrToggle<CR>',
	{ noremap = true, silent = true })



-- Floaterm config and keymaps

vim.api.nvim_set_var('floaterm_borderchars', '─│─│╭╮╯╰')

vim.api.nvim_set_keymap('n',
	'<C-b>',
	':FloatermNew --autoclose=2 --opener=edit --height=0.8 --width=0.9 --title=Ranger ranger<CR>',
	{ noremap = true, silent = true })

vim.api.nvim_set_keymap('n',
	'<C-t>',
	':FloatermNew --height=0.7 --width=0.6 --title=Terminal<CR>',
	{ noremap = true, silent = true })

vim.api.nvim_set_keymap('n',
	'<C-k>',
	'<C-\\><C-n>:FloatermKill<CR>',
	{ noremap = true, silent = true })

vim.api.nvim_set_keymap('t',
	'<Esc>',
	'<C-\\><C-n>:FloatermKill<CR>',
	{ noremap = true, silent = true })

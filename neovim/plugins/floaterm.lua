-- Floaterm config and keymaps

vim.api.nvim_set_var('floaterm_borderchars', '─│─│╭╮╯╰')

vim.api.nvim_set_keymap('n',
	'<C-b>',
	':FloatermNew --autoclose=2 --opener=edit --height=0.9 --width=0.8 --title=Ranger --name=ranger ranger<CR>',
	{ noremap = true, silent = true })

vim.api.nvim_set_keymap('n',
	'<C-t>',
	':FloatermToggle default<CR>',
	{ noremap = true, silent = true })

vim.api.nvim_set_keymap('t',
	'<C-t>',
	'<C-\\><C-n>:FloatermToggle default<CR>',
	{ noremap = true, silent = true })

-- Floaterm config and keymaps
vim.api.nvim_set_var('floaterm_borderchars', '─│─│╭╮╯╰')
vim.cmd('hi link FloatermBorder TelescopeBorder')

vim.api.nvim_set_keymap('n',
	'<C-t>',
	':FloatermToggle default<CR>',
	{ noremap = true, silent = true })

vim.api.nvim_set_keymap('t',
	'<C-t>',
	'<C-\\><C-n>:FloatermToggle default<CR>',
	{ noremap = true, silent = true })

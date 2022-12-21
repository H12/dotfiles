require('plugins')
require('lsp')

vim.cmd([[ syntax on ]])

-- Turn on termguicolors
vim.o.termguicolors = true

-- Disable line wrapping
vim.o.nowrap = false

-- Turn on relative line numbers
vim.o.number = true
vim.o.relativenumber = true

-- Turn of default greeter page
vim.o.shortmess = 'i'

-- Enable SignColumn globally
vim.o.signcolumn = 'yes'

-- Disable SignColumn on the greeter page
vim.opt_local.signcolumn = 'no'

-- Highlight search incrementally but not permanently
vim.opt.incsearch = true
vim.opt.hlsearch = false

-- Add text objects for "line"
vim.api.nvim_set_keymap('o', 'ii', ':<C-u>normal! v^o$h<cr>', {
	noremap = true,
	silent = true,
})

vim.api.nvim_set_keymap('x', 'ii', '^o$h', {
	noremap = true,
	silent = true,
})

-- Re-center cursor when paging vertically
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true })

-- Use Floaterm for Terminal one-offs
vim.api.nvim_create_user_command('T',
	'T FloatermNew --autoclose=0 --height=0.9 --width=0.9 --title=Command <args>',
	{}
)

vim.api.nvim_create_autocmd("VimEnter", {
	command = 'FloatermNew --silent --height=0.7 --width=0.6 --title=Terminal --name=default'
})

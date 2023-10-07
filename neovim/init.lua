-- Source plugin code
require('plugins')

vim.cmd [[colorscheme solarized]]

-- Turn on termguicolors
vim.o.termguicolors = true

-- Set single-line mouse scroll
vim.o.mousescroll = 'ver:1,hor:1'

-- Disable line wrapping
vim.o.wrap = false

-- Turn on relative line numbers
vim.o.number = true
vim.o.relativenumber = true

-- Enable SignColumn globally
vim.o.signcolumn = 'yes'

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

-- Remove greeter message stuff
vim.opt_local.signcolumn = 'no'
vim.o.shortmess = 'i'

-- Use global shared status line
vim.o.laststatus = 3

-- Re-center cursor when paging vertically
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true })

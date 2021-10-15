require('lsp')
require('plugins')

local u = require('utils')

-- Enable syntax first so `hi` cmds work
u.cmd('syntax on')

-- Turn on termguicolors
vim.opt.termguicolors = true

-- Gruvbox baby
u.cmd('colorscheme gruvbox')

u.cmd('hi GruvboxRedSign        ctermfg=167 ctermbg=none guibg=none')
u.cmd('hi GruvboxGreenSign      ctermfg=142 ctermbg=none guibg=none')
u.cmd('hi GruvboxYellowSign     ctermfg=214 ctermbg=none guibg=none')
u.cmd('hi GruvboxBlueSign       ctermfg=109 ctermbg=none guibg=none')
u.cmd('hi GruvboxPurpleSign     ctermfg=175 ctermbg=none guibg=none')
u.cmd('hi GruvboxAquaSign       ctermfg=108 ctermbg=none guibg=none')
u.cmd('hi GruvboxOrangeSign     ctermfg=208 ctermbg=none guibg=none')

-- Make the background transparent
u.cmd('hi Normal ctermbg=none guibg=none')

-- Telescope deps and config
u.map('<C-p>', ':Telescope find_files find_command=rg,--ignore,--hidden,--files<cr>')
u.map('<C-f>', ':Telescope live_grep find_command=rg,--hidden<cr>')

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

-- Lualine setup
require'lualine'.setup {
	options = {
		icons_enabled = true,
		theme = 'gruvbox',
		component_separators = {'', ''},
		section_separators = {'', ''},
		disabled_filetypes = {}
	},
	sections = {
		lualine_a = {},
		lualine_b = {'branch'},
		lualine_c = {'diff'},
		lualine_x = {'progress', 'location'},
		lualine_y = {},
		lualine_z = {}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {'filename', 'diff'},
		lualine_x = {'progress', 'location'},
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	extensions = {}
}

-- Tabline setup
require('tabby').setup({
	tabline = require('tabby.presets').tab_only
})

-- DevIcons setup
require'nvim-web-devicons'.setup({
	default = true;
})

-- Ranger & keybindings
u.map('<C-b>', ':Ranger<cr>')

-- Autocompletion
vim.o.completeopt = 'menuone,noselect'

require('compe').setup({
	enabled = true,
	source = {
		path = true,
		buffer = true,
		nvim_lsp = true,
	},
})

-- Speedy Stylish GitGutter
u.set_global('updatetime', 100)
u.cmd('hi link GitGutterAdd GruvboxGreenSign')
u.cmd('hi link GitGutterChange GruvboxYellowSign')
u.cmd('hi link GitGutterDelete GruvboxRedSign')
u.cmd('hi link GitGutterChangeDelete GruvboxOrangeSign')

-- Pane navigation respecting tmux
u.cmd('let g:tmux_navigator_no_mappings = 1')
u.cmd('let g:tmux_navigator_save_on_switch = 2')

u.map('<C-h>', ':TmuxNavigateLeft<cr>', 'n', { noremap=true, silent=true })
u.map('<C-j>', ':TmuxNavigateDown<cr>', 'n', { noremap=true, silent=true })
u.map('<C-k>', ':TmuxNavigateUp<cr>', 'n', { noremap=true, silent=true })
u.map('<C-l>', ':TmuxNavigateRight<cr>', 'n', { noremap=true, silent=true })
u.map('<C-\\>', ':TmuxNavigatePrevious<cr>', 'n', { noremap=true, silent=true })

-- Relative line numbers
u.set_window('number', true)
u.set_window('relativenumber', true)

u.cmd('hi CursorLineNR guibg=none')

-- Transparent SignColumn
u.set_window('signcolumn', 'yes')

u.cmd('hi SignColumn guibg=none')

-- Mouse settings
u.set_global('mouse', 'a')
u.set_global('scrolloff', 8)

-- Fancy whitespace characters
u.set_window('list', true)
u.set_global('listchars', 'trail:·,tab:>-')

u.cmd('hi SpecialKey ctermfg=59 guifg=#5f5f5f')

-- Search preferences
u.set_global('incsearch', true)

-- Pretty Terminal Commands
u.cmd('command -nargs=+ T :bot 20sp term://<args>')

-- Quickly Exit Terminal Mode
u.map('<ESC>', '<C-\\><C-N>', 't')

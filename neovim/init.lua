require('lsp')
require('plugins')

u = require('utils')

-- Enable syntax first so `hi` cmds work
u.cmd('syntax on')

-- Gruvbox baby
u.cmd('colorscheme gruvbox')
u.cmd('hi GruvboxRedSign        ctermfg=167 ctermbg=NONE')
u.cmd('hi GruvboxGreenSign      ctermfg=142 ctermbg=NONE')
u.cmd('hi GruvboxYellowSign     ctermfg=214 ctermbg=NONE')
u.cmd('hi GruvboxBlueSign       ctermfg=109 ctermbg=NONE')
u.cmd('hi GruvboxPurpleSign     ctermfg=175 ctermbg=NONE')
u.cmd('hi GruvboxAquaSign       ctermfg=108 ctermbg=NONE')
u.cmd('hi GruvboxOrangeSign     ctermfg=208 ctermbg=NONE')

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
		layout_strategy = "flex",
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
require('lualine').setup({
	options = { theme = 'gruvbox_material' }
})

-- DevIcons setup
require'nvim-web-devicons'.setup({
	default = true;
})

-- Ranger & keybindings
u.map('<C-b>', ':Ranger<cr>')

-- Autocompletion
vim.o.completeopt = "menuone,noselect"

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

u.cmd('hi GitGutterAdd          ctermfg=142')
u.cmd('hi GitGutterChange       ctermfg=214')
u.cmd('hi GitGutterDelete       ctermfg=167')
u.cmd('hi GitGutterChangeDelete ctermfg=208')

-- Relative line numbers
u.set_window('number', true)
u.set_window('relativenumber', true)

u.cmd('hi CursorLineNR ctermbg=NONE')

-- Transparent SignColumn
u.set_window('signcolumn', 'yes')

u.cmd('hi clear SignColumn')

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

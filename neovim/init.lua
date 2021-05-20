u = require('utils')

-- Enable syntax first so `hi` cmds work
u.cmd('syntax on')

-- Gruvbox baby
u.plugin 'gruvbox-community/gruvbox'

u.cmd('colorscheme gruvbox')
u.cmd('hi GruvboxRedSign        ctermfg=167 ctermbg=NONE')
u.cmd('hi GruvboxGreenSign      ctermfg=142 ctermbg=NONE')
u.cmd('hi GruvboxYellowSign     ctermfg=214 ctermbg=NONE')
u.cmd('hi GruvboxBlueSign       ctermfg=109 ctermbg=NONE')
u.cmd('hi GruvboxPurpleSign     ctermfg=175 ctermbg=NONE')
u.cmd('hi GruvboxAquaSign       ctermfg=108 ctermbg=NONE')
u.cmd('hi GruvboxOrangeSign     ctermfg=208 ctermbg=NONE')

-- Syntax highlighting
u.plugin 'elixir-editors/vim-elixir'

-- Telescope deps and config
u.plugin 'nvim-lua/popup.nvim'
u.plugin 'nvim-lua/plenary.nvim'
u.plugin 'nvim-telescope/telescope.nvim'

u.remap('<C-p>', ':Telescope find_files<cr>')

-- Tpope goodness
u.plugin 'tpope/vim-fugitive'
u.plugin 'tpope/vim-rhubarb'
u.plugin 'tpope/vim-repeat'
u.plugin 'tpope/vim-surround'

-- Stylish GitGutter
u.plugin 'airblade/vim-gitgutter'

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
u.set_window('listchars', 'trail:·,tab:>-')

u.cmd('hi SpecialKey ctermfg=59 guifg=#5f5f5f')

-- Search preferences
u.set_global('incsearch', true)
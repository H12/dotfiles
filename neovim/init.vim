" Enable syntax first so `hi` cmds work
syntax on

" Turn on termguicolors
set termguicolors

" Gruvbox baby
colorscheme gruvbox

hi GruvboxRedSign        ctermfg=167 ctermbg=none guibg=none
hi GruvboxGreenSign      ctermfg=142 ctermbg=none guibg=none
hi GruvboxYellowSign     ctermfg=214 ctermbg=none guibg=none
hi GruvboxBlueSign       ctermfg=109 ctermbg=none guibg=none
hi GruvboxPurpleSign     ctermfg=175 ctermbg=none guibg=none
hi GruvboxAquaSign       ctermfg=108 ctermbg=none guibg=none
hi GruvboxOrangeSign     ctermfg=208 ctermbg=none guibg=none

" Make the background transparent
hi Normal ctermbg=none guibg=none

" Don't highlight markdown errors
hi markdownError guifg=None guibg=None

" Speedy Stylish GitGutter
set updatetime=100

hi link GitGutterAdd GruvboxGreenSign
hi link GitGutterChange GruvboxYellowSign
hi link GitGutterDelete GruvboxRedSign
hi link GitGutterChangeDelete GruvboxOrangeSign

" Pane navigation respecting tmux
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_save_on_switch = 2

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>

" Relative line numbers
set number
set relativenumber

hi CursorLineNR guibg=none

" Transparent SignColumn
set signcolumn=yes
hi SignColumn guibg=none

" Mouse settings
set mouse=a
set scrolloff=8

" Search preferences
set incsearch

" Pretty Terminal Commands
command -nargs=+ T :bot 20sp term://<args>

" Quickly Exit Terminal Mode
tnoremap <ESC> <C-\><C-N>

" Add a 'line' text object mapped to `ii`
onoremap <silent> ii :<c-u>normal! v^o$h<cr>
xnoremap <silent> ii ^o$h

" Include lua config
lua require('plugins')
lua require('lsp')

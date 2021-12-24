" Enable syntax first so `hi` cmds work
syntax on

" Turn on termguicolors
set termguicolors

" Don't highlight markdown errors
hi markdownError guifg=None guibg=None

" Pane navigation respecting tmux
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_save_on_switch = 2

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>

" Prevent line wrapping
set nowrap

" Relative line numbers
set number
set relativenumber

" Persist SignColumn
set signcolumn=yes

" Mouse settings
set mouse=a
set scrolloff=8

" Highlight search incrementally
set incsearch

" Pretty Terminal Commands
command -nargs=+ T FloatermNew <args>

" Quickly Exit Terminal Mode
tnoremap <ESC> <C-\><C-N>

" Add a 'line' text object mapped to `ii`
onoremap <silent> ii :<c-u>normal! v^o$h<cr>
xnoremap <silent> ii ^o$h

" Include lua config
lua require('plugins')
lua require('lsp')

" Highlight Floaterm After `require`
hi link FloatermBorder White

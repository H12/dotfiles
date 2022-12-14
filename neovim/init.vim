" Include lua config
lua require('plugins')
lua require('lsp')

" Enable syntax first so `hi` cmds work
syntax on

" Turn on termguicolors
set termguicolors

" Turn off startup message
set shortmess=I

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

" Highlight current row of cursor
set cursorline

" Enable SignColumn globally
set signcolumn=yes

" Disable SignColumn locally on the greeter page
setlocal signcolumn=no

" Use global statusline After `require`
set laststatus=3

" Mouse settings
set mouse=a
set scrolloff=8

" Highlight search incrementally
set incsearch

" Pretty Terminal Commands
command -nargs=+ T FloatermNew --autoclose=0 --height=0.9 --width=0.9 --title=Command <args>

" Set up default floaterm terminal for fast toggling
augroup term_setup
	autocmd VimEnter * FloatermNew --silent --height=0.7 --width=0.6 --title=Terminal --name=default
augroup END

" Add a 'line' text object mapped to `ii`
onoremap <silent> ii :<c-u>normal! v^o$h<cr>
xnoremap <silent> ii ^o$h

" Add remap for vertical nav
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Turn on completion
set completeopt=menu,menuone,noselect

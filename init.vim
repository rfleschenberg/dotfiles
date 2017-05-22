call plug#begin('~/.local/share/nvim/plugged')
Plug 'mhartington/oceanic-next'
Plug 'vimjas/vim-python-pep8-indent'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-jedi'
call plug#end()

"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"
syntax on
filetype plugin indent on

set bg=dark
colorscheme OceanicNext

set shiftwidth=4 softtabstop=4 tabstop=4 expandtab
set textwidth=79
set formatoptions=tcqn
set smarttab
set cindent smartindent autoindent
set noeol
set number
set modeline
set hidden
set showcmd
set ignorecase
set wildignorecase
set smartcase
set incsearch
set autowrite
set nohlsearch
set completeopt-=preview
set statusline=%n:\ %f\ %m%r\ %h\ %y\ %c
set laststatus=2
set wildmenu
set visualbell t_vb=
set nostartofline

autocmd Filetype html setlocal ts=2 sw=2 tw=0
autocmd Filetype htmldjango setlocal ts=2 sw=2 tw=0
autocmd Filetype yaml setlocal ts=2 sw=2 tw=0

" Prevent some backspace problems
set backspace=indent,eol,start

highlight ExtraWhiteSpace ctermbg=red guibg=red
match ExtraWhiteSpace /\s\+$/

inoremap jk <ESC>
noremap vv <ESC>:w<return>
let mapleader = "\<Space>"

let g:local_vimrc = '.vimrc'

let g:python_host_prog = '/home/rene/local/bin/python2'
let g:python3_host_prog = '/home/rene/local/bin/python3'

let g:deoplete#enable_at_startup = 1

syntax on
filetype plugin indent on

set bg=dark

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

" Highlight trailing whitespace
highlight ExtraWhiteSpace ctermbg=red guibg=red
match ExtraWhiteSpace /\s\+$/

" Key bindings
inoremap jk <ESC>
noremap vv <ESC>:w<return>
let mapleader = "\<Space>"

"local_vimrc
let g:local_vimrc = '.vimrc'


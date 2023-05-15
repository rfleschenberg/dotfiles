call plug#begin('~/.local/share/nvim/plugged')
Plug 'mhartington/oceanic-next'
Plug 'vimjas/vim-python-pep8-indent'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'chr4/nginx.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'hashivim/vim-terraform'
Plug 'tmhedberg/SimpylFold'
Plug 'psf/black', { 'branch': 'stable' }
call plug#end()

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
set laststatus=2
set wildmenu
set visualbell t_vb=
set nostartofline
" Do not fold by default
set foldlevel=99

autocmd Filetype html setlocal ts=2 sw=2 tw=0
autocmd Filetype htmldjango setlocal ts=2 sw=2 tw=0
autocmd Filetype yaml setlocal ts=2 sw=2 tw=0

" Prevent some backspace problems
set backspace=indent,eol,start

" https://github.com/neovim/neovim/issues/6798
set guicursor=

highlight ExtraWhiteSpace ctermbg=red guibg=red
match ExtraWhiteSpace /\s\+$/

inoremap jk <ESC>
noremap vv <ESC>:w<return>
let mapleader = "\<Space>"

let g:local_vimrc = '.vimrc'

let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('auto_complete_delay', 20)

let g:black_quiet = 1
autocmd BufWritePre *.py execute ':Black'

nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>f :CtrlPMRUFiles<CR>
nnoremap <Leader># :b#<CR>
nnoremap <Leader>p O__import__("pdb").set_trace()  # FIXME<ESC>

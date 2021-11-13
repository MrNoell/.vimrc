" _   _       _
"| \ | |     | |
"|  \| |     | |
"| . ` |     | |
"| |\  |  _  | |____ 
"|_| \_| |_| |______|
"

"TODO: find a way to run stuff directly from vim and not from the terminal
"	   error cheching

filetype indent plugin on
syntax on

call plug#begin()

Plug 'chriskempson/base16-vim'
Plug 'itchyny/lightline.vim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
rlug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'ryanoasis/vim-devicons'
  
call plug#end()

colorscheme base16-default-dark

set nocompatible
set relativenumber
set number
set nowrap
set encoding=UTF-8
set showcmd
set noshowmode
set hidden
set termguicolors
set cindent
set title
set belloff=all
set tabstop=4 softtabstop=4
set colorcolumn=80
set shiftwidth=4
set autoindent
set smartindent
set incsearch
set ignorecase
set title
set smartcase
set path+=***
set wildignorecase
set wildmenu
set ttimeout
set ttimeoutlen=100
set updatetime=50
set scrolloff=10 
set splitbelow splitright
set laststatus=2

let base16colorspace=256
let g:lightline = {
	\ 'colorscheme': 'seoul256',
	\ 'active': {
	\	'left': [ [ 'mode', 'paste' ], 
	\			  [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \	'gitbranch': 'FugitiveHead'
    \ },
	\ }

nnoremap Y y$
nnoremap <C-p> :FZF<CR>
nnoremap <C-h> :wincmd h<CR>
nnoremap <C-l> :wincmd l<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
map cc <plug>NERDCommenterToggle

autocmd bufenter * if(winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

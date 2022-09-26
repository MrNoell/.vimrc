" _   _       _
"| \ | |     | |
"|  \| |     | |
"| . ` |     | |
"| |\  |  _  | |____ 
"|_| \_| |_| |______|
"

scriptencoding=utf-8
filetype indent plugin on
syntax on

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

let s:clip = '/mnt/c/Windows/System32/clip.exe'
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
	augroup END
endif"

call plug#begin("~/.vim/plugged")

Plug 'itchyny/lightline.vim'
Plug 'rakr/vim-one'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'junegunn/goyo.vim'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'  

call plug#end()

set bg=dark
set nocompatible
set relativenumber number
set nowrap
set encoding=utf-8
set fileencoding=utf-8
set showcmd
set noshowmode
set noerrorbells
set hidden
set termguicolors
set cindent
set title
set belloff=all
set tabstop=4 softtabstop=4
set colorcolumn=80
set shiftwidth=4
set autoindent
set hls
set cursorline
set breakindent
set smartindent
set incsearch
set ignorecase
set nobackup
set noswapfile
set undofile
set undodir=~/.vim/undodir
set completeopt=menuone,noinsert,noselect
set undofile
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
set signcolumn=yes
set mouse=a
setlocal spell spelllang=en

let g:lightline = {
	\ 'colorscheme' : 'one',
	\ 'active': {
	\	'left': [ [ 'mode', 'paste' ], 
	\			  [ 'gitbranch', 'filename', 'readonly' ] ]
	\ },
	\ 'component_function': {
	\	'gitbranch': 'FugitiveHead',
	\	'filename': 'LightlineFilename'
	\ },
	\ }


function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction

let g:one_allow_italics = 1

let g:netrw_keepdir = 0
let g:netrw_winsize = 15
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_localcopydircmd = 'cp -r'

nnoremap Y y$
nnoremap + <C-a>
nnoremap - <C-x>
nnoremap x "_x
noremap <C-n> :Lex<CR>
nnoremap <C-a> gg<S-v>G
nnoremap <C-p> :Files<CR>
map <C-h> <C-\><C-n><C-W>h<CR>
map <C-l> <C-W>l<CR>
map <C-j> <C-W>j<CR>
map <C-k> <C-W>k<CR>
map cc <plug>NERDCommenterToggle

colorscheme one

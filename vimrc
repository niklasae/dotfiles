set encoding=utf-8
autocmd! bufwritepost .vimrc source %

" Plugings
" ========
" Set up bundles using Pathogen (https://github.com/tpope/vim-pathogen) 
filetype off
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
"call pathogen#helptags()
syntax on
filetype plugin indent on


" General options
" ===============
inoremap jj <Esc>  
let mapleader=","
set autoread " reload file when changed in other editors

" Appearance
set ruler
set showcmd
set laststatus=2
set listchars=tab:▸\ ,eol:¬
set number
set cursorline " highlight current line
set colorcolumn=80

" Indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
	
" Quick save
noremap <Leader>w :update<CR>

" Quick quit
noremap <Leader>e :quit<CR>

" Window switching 
nnoremap <C-k> <C-W>k
nnoremap <C-j> <C-W>j
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l


" Colorscheme
" ===========
colorscheme Tomorrow
" Solarized in gnome terminal
" (http://www.webupd8.org/2011/04/solarized-must-have-color-paletter-for.html)
" set background=dark
" colorscheme solarized
" let g:solarized_termcolors=256



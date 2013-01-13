set encoding=utf-8
autocmd! bufwritepost .vimrc source %

" Plugings
" ========
" Started using Vundle - https://github.com/gmarik/vundle
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

"
" My Bundles here:
"

" original repos on github
Bundle 'altercation/vim-colors-solarized'
"Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}

" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'

" non github repos
"Bundle 'git://git.wincent.com/command-t.git'
"Bundle 'hg://hg@bitbucket.org/abudden/taghighlight'

filetype plugin indent on     " required!


" General options
" ===============
" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

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
noremap <Leader>q :quit<CR>

" Window switching 
nnoremap <C-k> <C-W>k
nnoremap <C-j> <C-W>j
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l


" Colorscheme
" ===========
"colorscheme Tomorrow
" Solarized in gnome terminal
" (http://www.webupd8.org/2011/04/solarized-must-have-color-paletter-for.html)
set t_Co=256
colorscheme solarized
set background=dark
"let g:solarized_termcolors=256



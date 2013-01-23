set encoding=utf-8
autocmd! bufwritepost .vimrc source %


" -------------------------------------------------- 
" Plugings
" -------------------------------------------------- 

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

" Colors from github
Bundle 'altercation/vim-colors-solarized'
Bundle 'jonathanfilip/vim-lucius'
Bundle 'endel/vim-github-colorscheme'

" original repos on github
Bundle 'scrooloose/nerdtree'
Bundle 'nvie/vim-flake8'
Bundle 'wincent/Command-T'
Bundle 'mattn/zencoding-vim'
" Bundle 'tpope/vim-fugitive'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}

" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'

" non github repos
"Bundle 'hg://hg@bitbucket.org/abudden/taghighlight'

filetype plugin indent on     " required!


" -------------------------------------------------- 
" Plugin config
" -------------------------------------------------- 

" Flake8
autocmd BufWritePost *.py call Flake8() " Auto run flake8 on every *.py save
let g:flake8_ignore="E501"
let g:flake8_max_line_length=80

" Command-T
:set wildignore+=*.class,**/target/**,**/*env.CATALINA_HOME*/**,*.pyc,.git

" ZenCoding
let g:user_zen_expandabbr_key='<c-e>'


" -------------------------------------------------- 
" General options
" -------------------------------------------------- 

set autoread " reload file when changed in other editors - not working completely...
set clipboard=unnamedplus " set system clipboard to "+ - see :reg
set dir=~/tmp/swp//,~/tmp//,. " put swp files in tmp dir if it exists
set incsearch " incremental search

" Indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab


" -------------------------------------------------- 
" Navigation
" -------------------------------------------------- 
" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Window switching 
nnoremap <C-k> <C-W>k
nnoremap <C-j> <C-W>j
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l


" -------------------------------------------------- 
" Leader remaps
" -------------------------------------------------- 
inoremap jj <Esc>  
let mapleader=","

noremap <Leader>w :update<CR> " Quick save
noremap <Leader>q :quit<CR> " Quick quit
noremap <Leader>x :wq<CR> " Quick save & quit
noremap <Leader>e :e<CR> " Quick reload


" -------------------------------------------------- 
" Trix
" -------------------------------------------------- 
" show all TODOs in quickfix window
noremap <Leader>do :noautocmd vimgrep /TODO/j **/*.*<CR>:cw<CR>


" -------------------------------------------------- 
" Appearance
" -------------------------------------------------- 
set ruler
set showcmd
set laststatus=2
set listchars=tab:▸\ ,eol:¬
set listchars=tab:>-,eol:$,trail:~,extends:>,precedes:<
set list
set number
set cursorline " highlight current line
set colorcolumn=160


" -------------------------------------------------- 
" Colorscheme
" -------------------------------------------------- 
set t_Co=256

" colorscheme Tomorrow-Night

" Solarized in gnome terminal
" (http://www.webupd8.org/2011/04/solarized-must-have-color-paletter-for.html)
" colorscheme solarized
" set background=dark
" set background=light
" let g:solarized_termcolors=256

colorscheme lucius
LuciusLightHighContrast

" colorscheme github

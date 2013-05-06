set encoding=utf-8
autocmd! bufwritepost .vimrc source %
let mapleader=","

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

" ~~~ Colors from github ~~~
Bundle 'lorry-lee/vim-ayumi'
Bundle 'endel/vim-github-colorscheme'
Bundle 'nanotech/jellybeans.vim'
Bundle 'jonathanfilip/vim-lucius'
Bundle 'tomasr/molokai'
Bundle 'altercation/vim-colors-solarized'
Bundle 'shawncplus/skittles_berry'
Bundle 'tpope/vim-vividchalk'

" ~~~ Colors from vim-scripts ~~~
Bundle 'candycode.vim'
Bundle 'pyte'
Bundle 'Wombat'

" ~~~ Original repos on github ~~~
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'nvie/vim-flake8'
Bundle 'wincent/Command-T'
" sparkup insted of zencoding
" Bundle 'mattn/zencoding-vim'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'Raimondi/delimitMate'
Bundle 'ervandew/supertab'
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'kien/ctrlp.vim'
" Multi lang syntax checker and linting
Bundle 'scrooloose/syntastic'
" Bundle 'koron/minimap-vim'
" Bundle 'Lokaltog/powerline'
" Bundle 'Lokaltog/vim-easymotion'
Bundle 'kchmck/vim-coffee-script'
" Sublime Text 2 style multi select/edit
Bundle 'hlissner/vim-multiedit'
" Bundle 'Glench/Vim-Jinja2-Syntax'
" LESS and CSS support
Bundle 'grooenewege/vim-less'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'skammer/vim-css-color'
" Indent Guides
Bundle 'nathanaelkane/vim-indent-guides'
" Auto re-size windows
" Bundle 'justincampbell/vim-eighties'
" :Qargs command - populate the argument list from the files in the quickfix list
Bundle 'nelstrom/vim-qargs'
" Search selection in visual mode (*/#)
Bundle 'nelstrom/vim-visual-star-search'
" Nice and useful undotree
Bundle 'sjl/gundo.vim'
" Vim as Python IDE with Jedi codecompletion - (pip install jedi)
Bundle 'davidhalter/jedi-vim'

" ~~~ vim-scripts repos ~~~
"Bundle 'L9'
"Bundle 'FuzzyFinder'
Bundle 'mru.vim'
Bundle 'nginx.vim'
Bundle 'Jinja'

" ~~~ Non github repos ~~~
"Bundle 'hg://hg@bitbucket.org/abudden/taghighlight'

filetype plugin indent on     " required!


" -------------------------------------------------- 
" Plugin config
" -------------------------------------------------- 

" Ack
" Open a new tab and search
nnoremap <Leader>a :tab split<CR>:Ack ""<Left>
nnoremap <Leader>A :tab split<CR>:Ack <C-r><C-w><CR>

" CoffeeScript / coffee-script
nnoremap <Leader>cc :CoffeeCompile vertical<CR>
nnoremap <Leader>cl :CoffeeLint<CR>
nnoremap <Leader>cr :CoffeeRun<CR>

" Command-T
" let g:CommandTMaxHeight=15  " Limit results
" let g:CommandTMatchWindowAtTop=1  " See the matches on the top

" Flake8
" let g:flake8_ignore="E501"
" let g:flake8_max_line_length=160
" autocmd BufWritePost *.py call Flake8()  " Auto run flake8 on every *.py save
autocmd FileType python map <Leader>8 :call Flake8()<CR>

" Gundo - useful undo-tree
nnoremap <Leader>gu :GundoToggle<CR>

" Indent Guides
nnoremap <Leader>ig :IndentGuidesToggle<CR>
let g:indent_guides_color_change_percent = 5
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 0
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']

" LESS and CSS
nnoremap <Leader>m :w <BAR> !lessc % > %:t:r.css<CR><space>  " Compile LESS to CSS
" Highlight and match vendor specific prefixes
nnoremap <Leader>vp :highlight VendorPrefix guifg=#00ffff gui=bold<CR>:match VendorPrefix /-\(moz\|webkit\|o\|ms\)-[a-zA-Z-]\+/<CR>

" MRU
let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'

" NERDTree
noremap <Leader>n :NERDTreeToggle<CR>
noremap <Leader>N :NERDTreeFind<CR>  " show current file in tree
let NERDTreeIgnore = ['\.pyc$']

" SuperTab - <TAB> completion
let g:SuperTabDefaultCompletionType="context"
" let g:SuperTabMappingForward='<C-space>'
" let g:SuperTabMappingBackward='<s-C-space>'

" Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=10

" Tagbar
let g:tagbar_userarrows=1
nnoremap <Leader>r :TagbarToggle<CR>

" Ingnore for search - CommandT & CtrlP
:set wildignore+=*.class,**/target/**,**/*env.CATALINA_HOME*/**,*.pyc,.git,**/gen/**


" -------------------------------------------------- 
" General options
" -------------------------------------------------- 

set clipboard=unnamedplus " set system clipboard to "+ - see :reg

" Indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set splitright  " Open splits to the right

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

" Tab switching
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" Better move to end and beginning of line
nnoremap H ^
nnoremap L $

:set suffixesadd+=.py,.js " files to recognise when jumping with gf


" -------------------------------------------------- 
" Leader remaps
" -------------------------------------------------- 
inoremap jj <Esc>  

noremap <Leader>w :update<CR> " Quick save
noremap <Leader>q :quit<CR> " Quick quit
noremap <Leader>x :wq<CR> " Quick save & quit
noremap <Leader>e :e<CR> " Quick reload

noremap <Leader>l :set list!<CR> " Toggle show/hide listchars

nmap <silent> <Leader>s :set spell!<CR>
set spelllang=en_gb  " I like British English...

" This unsets the 'last search pattern' register by hitting return
nnoremap <CR> :noh<CR><CR>

" -------------------------------------------------- 
" Trix
" -------------------------------------------------- 
" show all TODOs in quickfix window
noremap <Leader>do :noautocmd vimgrep /TODO/j **/*.*<CR>:cw<CR>
" noremap <Leader>do :noautocmd vimgrep /TODO\|FIXME\|XXX/j **/*.*<CR>:cw<CR>

" Find occurences, but stay put... to highlight all...
noremap <Leader>* *N

" Save file with root permissions
cmap w!! w !sudo tee >/dev/null %


" -------------------------------------------------- 
" Appearance
" -------------------------------------------------- 
set number
set cursorline " highlight current line
set colorcolumn=160
set hlsearch " highlight search


" -------------------------------------------------- 
" Colorscheme
" -------------------------------------------------- 
" if $TERM == "xterm-256color"
"   set t_Co=256
" endif
set t_Co=256

" colorscheme Tomorrow-Night

" Solarized in gnome terminal
" (http://www.webupd8.org/2011/04/solarized-must-have-color-paletter-for.html)
" set background=dark
" set background=light
" let g:solarized_termtrans=1
" let g:solarized_termcolors=256
" let g:solarized_contrast="high"
" let g:solarized_visibility="high"
" colorscheme solarized

" colorscheme lucius
" LuciusLightHighContrast

" colorscheme github
" colorscheme vividchalk
colorscheme candycode

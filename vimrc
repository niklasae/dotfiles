set encoding=utf-8
autocmd! bufwritepost .vimrc source %
let mapleader=","

" -------------------------------------------------- 
" Plugings
" -------------------------------------------------- 

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif


" -------------------------------------------------- 
" Post Plugings
" -------------------------------------------------- 

" Set .vim and .vim/after first and last on runtimepath
" This is needed to get local spell file working among others.
set rtp-=~/.vim
set rtp^=~/.vim
set rtp-=~/.vim/after
set rtp+=~/.vim/after


" -------------------------------------------------- 
" Plugin config
" -------------------------------------------------- 

" Ack
" Open a new tab and search
nnoremap <Leader>a :tab split<CR>:Ack ""<Left>
nnoremap <Leader>A :tab split<CR>:Ack <C-r><C-w><CR>

" CoffeeScript / coffee-script
nnoremap <Leader>cc :CoffeeCompile<CR>
nnoremap <Leader>cl :CoffeeLint<CR>
nnoremap <Leader>cr :CoffeeRun<CR>
let coffee_compile_vert = 1
let coffee_run_vert = 1
let coffee_watch_vert = 1

" Emmet
let g:user_emmet_leader_key = '<c-e>'
let g:user_emmet_settings = {
\    'html' : {
\        'extends' : 'html',
\        'indentation' : '    ',
\    },
\    'htmldjango' : {
\        'extends' : 'html',
\    },
\    'htmljinja' : {
\        'extends' : 'html',
\    },
\    'jinja' : {
\        'extends' : 'html',
\    },
\    'php' : {
\        'extends' : 'html',
\        'filters' : 'c',
\    },
\}

" GitGutter
" Only use when I say
let g:gitgutter_enabled = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0


" Github Gist
let g:gist_detect_filetype = 1
let g:gist_show_privates = 1
let g:gist_post_private = 1


" Gundo - useful undo-tree
nnoremap <Leader>gu :GundoToggle<CR>

" Indent Guides
nnoremap <Leader>ig :IndentGuidesToggle<CR>
let g:indent_guides_color_change_percent = 5
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 0
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']

" Jedi
" Really only using defaults, but want to keep track of anyway
let g:jedi#goto_assignments_command = "<Leader>g"
let g:jedi#goto_definitions_command = "<Leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#rename_command = "<Leader>rnc"
let g:jedi#usages_command = "<Leader>rnn"
let g:jedi#completions_command = "<C-Space>"

" Virtualenv
" Autodect activated virtualenvs to help Jedi
" https://github.com/davidhalter/jedi-vim/issues/685#issuecomment-291632671
let g:virtualenv_auto_activate = 1

" LESS and CSS
nnoremap <Leader>lc :w <BAR> !lessc % > %:t:r.css<CR><space>  " Compile LESS to CSS
" Highlight and match vendor specific prefixes
nnoremap <Leader>vp :highlight VendorPrefix guifg=#00ffff gui=bold<CR>:match VendorPrefix /-\(moz\|webkit\|o\|ms\)-[a-zA-Z-]\+/<CR>

" MRU
let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'

" NERDTree
noremap <Leader>n :NERDTreeToggle<CR>
noremap <Leader>N :NERDTreeFind<CR>  " show current file in tree
let NERDTreeIgnore = ['\.pyc$']

" Python-mode
" Turn off rope and use Jedi instead
let g:pymode_rope = 0
" Enable linting and auto write check
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_onfly = 0
let g:pymode_lint_write = 1
let g:pymode_lint_ignore = "E501,E128"
" Enable folding
let g:pymode_folding = 1

" Sparkup
" Get sparkup in other filetypes than html
" See: https://github.com/rstacruz/sparkup/issues/33#issuecomment-3135285
augroup sparkup_types
  " Remove ALL autocommands of the current group.
  autocmd!
  " Add sparkup to new filetypes
  autocmd FileType mustache,htmldjango,htmljinja runtime! bundle/sparkup/vim/ftplugin/html/sparkup.vim
augroup END

" SuperTab - <TAB> completion
let g:SuperTabDefaultCompletionType="context"
" let g:SuperTabMappingForward='<C-space>'
" let g:SuperTabMappingBackward='<s-C-space>'

" Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=10
" Enable active linting and disable lint for some types(:SyntasticCheck)
" python - python-mode linter
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['python'] }

" Tagbar
let g:tagbar_userarrows=1
nnoremap <Leader>r :TagbarToggle<CR>

" TaskList
map <Leader>td :TaskList<CR>

" Ingnore for search - CtrlP
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']  " Ignore files in .gitignore


" -------------------------------------------------- 
" General options
" -------------------------------------------------- 

" Events triggering auto check if buffers changed outside of Vim
au CursorHold * checktime
au WinEnter * checktime
au BufWinEnter * checktime

set clipboard=unnamedplus " set system clipboard to "+ - see :reg

" Get path/filename
:let @+ = expand("%")  " relative path
:let @+ = expand("%:p")  " full path
:let @+ = expand("%:t")  " just filename

" Indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set splitright  " Open splits to the right

" Status Line
"set statusline=%t       "tail of the filename
set statusline=%f       "filename
set statusline+=%m      "modified flag
set statusline+=%h      "help file flag
set statusline+=%=      "left/right separator
set statusline+=%y      "filetype
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}]\ \  "file format
set statusline+=%c,%l     "cursor column, cursor line
set statusline+=\ %L   "/total lines
set statusline+=\ %P    "percent through file

" backup/swap/undo - used to exist in vim-sensible
set noswapfile  " do not store swap files
set backupdir=~/.local/share/vim/backup
set backup
set undodir=~/.local/share/vim/undo
set undofile
set undolevels=1000  "maximum number of changes that can be undone
set undoreload=10000  "maximum number lines to save for undo on a buffer reload

" Pattern to ignore when expanding wildcards (CtrlP...)
:set wildignore+=.git
:set wildignore+=*.class
:set wildignore+=*.pyc
:set wildignore+=**/bower_components/**
:set wildignore+=**/*env.CATALINA_HOME*/**
:set wildignore+=**/gen/**
:set wildignore+=**/node_modules/**
:set wildignore+=**/target/**


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
nnoremap <C-e> $
inoremap <C-e> <Esc>A

:set suffixesadd+=.py,.js " files to recognise when jumping with gf

" Copy/Yank the rest of line
nnoremap Y y$

" -------------------------------------------------- 
" Leader remaps
" -------------------------------------------------- 
inoremap jj <Esc>

noremap <Leader>w :update<CR> " Quick save
noremap <Leader>q :quit<CR> " Quick quit
noremap <Leader>x :wq<CR> " Quick save & quit
noremap <Leader>e :e<CR> " Quick reload

" Display invisible characters
set listchars=tab:>\ ,trail:•,extends:>,precedes:<,nbsp:+
set list
noremap <Leader>l :set list!<CR> " Toggle show/hide listchars

nmap <silent> <Leader>s :set spell!<CR>
set spelllang=en_gb  " I like British English...

" Make it easy to save session in ~/.locale/share/vim/sessions
nnoremap <Leader>mks :mks! ~/.local/share/vim/sessions/

" This unsets the 'last search pattern' register by hitting return
nnoremap <CR> :noh<CR><CR>

" -------------------------------------------------- 
" Trix
" -------------------------------------------------- 
" show all TODO/FIXME/XXX in quickfix window
" noremap <Leader>do :noautocmd vimgrep /TODO/j **/*.*<CR>:cw<CR>
" noremap <Leader>do :noautocmd vimgrep /\(TODO\|FIXME\|XXX\)/j **/*.*<CR>:cw<CR>
noremap <Leader>do :Ggrep \( -e TODO -e FIXME -e XXX \)<CR>

" Find occurences, but stay put... to highlight all...
noremap <Leader>* *N

" Save file with root permissions (inspired by `$ sudo !!`)
cmap w!! %!sudo tee >/dev/null %


" -------------------------------------------------- 
" Searching
" -------------------------------------------------- 
" Enable smartcase (needs ignorecase) - lower finds all / upper finds exact
" Enable incremental search to see matches as we type
set ignorecase
set smartcase
set incsearch


" -------------------------------------------------- 
" Appearance
" -------------------------------------------------- 
set number
set cursorline " highlight current line
set colorcolumn=80
set hlsearch " highlight search


" -------------------------------------------------- 
" Appearance - Powerline
" -------------------------------------------------- 
set rtp+=/usr/share/powerline/bindings/vim/
" Always show statusline
set laststatus=2


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
" colorscheme candycode
colorscheme Monokai

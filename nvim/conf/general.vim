set clipboard=unnamedplus " set system clipboard to "+ - see :reg

set number  " I love my numbers...

" Indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Open splits to the below or to the right
set splitbelow
set splitright

" Fast escape
inoremap jj <Esc>

" Split switching 
nnoremap <C-k> <C-W>k
nnoremap <C-j> <C-W>j
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" backup/swap/undo - used to exist in vim-sensible
set noswapfile  " do not store swap files
set backupdir=~/.local/share/vim/backup
set backup
set undodir=~/.local/share/vim/undo
set undofile
set undolevels=1000  "maximum number of changes that can be undone
set undoreload=10000  "maximum number lines to save for undo on a buffer reload

" Get path/filename - https://vim.fandom.com/wiki/Copy_filename_to_clipboard
nmap <Leader>cs :let @+ = expand("%")<CR>  " relative path
nmap <Leader>cl :let @+ = expand("%:p")<CR>  " full path
nmap <Leader>cn :let @+ = expand("%:t")<CR>  " just filename

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

" Unsets the 'last search pattern' register by hitting return
nnoremap <CR> :noh<CR><CR>

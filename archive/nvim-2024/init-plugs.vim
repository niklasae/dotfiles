" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
" call plug#begin('~/.vim/plugged')
call plug#begin(stdpath('data') . '/plugged')

" Make sure you use single quotes

Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'brentyi/isort.vim'  " Requires python isort

" Fuzzy Find
Plug 'nvim-lua/plenary.nvim'  " Required by telescope
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }

" Git
Plug 'f-person/git-blame.nvim'

" Colorschemes
Plug 'UtkarshVerma/molokai.nvim', { 'branch': 'main' }

" Copilot
Plug 'github/copilot.vim'
Plug 'CopilotC-Nvim/CopilotChat.nvim', { 'branch': 'canary' }  " Depends on copilot.vim and plenary.nvim

" Initialize plugin system
call plug#end()

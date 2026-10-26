" Colorscheme
"colorscheme molokai-light
colorscheme molokai

" NERDTree
noremap <Leader>n :NERDTreeToggle<CR>
noremap <Leader>N :NERDTreeFind<CR>  " show current file in tree
noremap <Leader>z :NERDTreeClose<CR><C-W>\|<C-W>_  " zoom
noremap <Leader>zz :NERDTreeClose<CR><C-W>=  " un-zoom
let NERDTreeIgnore = ['\.pyc$']


" Telescope
nnoremap <C-p> <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
" Navigate Telescope using h/j
let g:telescope_custom_keybindings = [
  \ {
  \   'key': 'h',
  \   'val': "@normal(':Telescope move_selection_previous<cr>')"
  \ },
  \ {
  \   'key': 'j',
  \   'val': "@normal(':Telescope move_selection_next<cr>')"
  \ },
\ ]

" CopilotChat
lua << EOF
require('CopilotChat').setup {
    debug = true, -- Enable debug mode
    -- See https://github.com/CopilotC-Nvim/CopilotChat.nvim/blob/canary/lua/CopilotChat/config.lua for more
}
EOF
nnoremap <leader>cc :CopilotChat<CR>

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Fast escape
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true, desc = "Fast escape" })

-- Save file
vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true, silent = true, desc = "Save file" })

-- Fast close window
vim.keymap.set("n", "<leader>qc", ":q<CR>", { noremap = true, silent = true, desc = "Close window" })

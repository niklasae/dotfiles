-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- I prefer to use the leader key as comma, but will try <Space> for a while
-- vim.g.mapleader = ","

vim.wo.relativenumber = false

-- Disable swap files, backup files, and writebackup files
vim.opt.swapfile = false -- no swapfiles
vim.opt.backup = false -- optional: no backup files
vim.opt.writebackup = false -- optional: no writebackup files
vim.opt.undofile = true -- keep persistent undo instead (recommended)

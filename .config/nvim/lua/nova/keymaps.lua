local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- remap space key to leader
keymap("", "<space>", "<Nop>", opts)

-- Opens file explorer
keymap("n", "<leader>e", ":NvimTreeOpen<cr>", opts)

-- New tab 
keymap("n", "<leader>t", ":tabnew<cr>", opts)
-- Switch between tabs
keymap("n", "<leader>n", ":tabn<cr>", opts)
keymap("n", "<leader>p", ":tabp<cr>", opts)


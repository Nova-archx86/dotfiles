local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- remap space key to leader
keymap("", "<space>", "<Nop>", opts)

-- Open terminal buffer
keymap("n", "<leader>t", ":ToggleTerm<cr>", opts)

-- New tab 
keymap("n", "<leader>n", ":tabnew<cr>", opts)
keymap("n", "<leader>,", ":tabp<cr>", opts)
keymap("n", "<leader>.", ":tabn<cr>", opts)

-- nvim tree
keymap("n", "<leader>e", ":NvimTreeOpen<cr>", opts)
keymap("n", "<leader>r", ":NvimTreeClose<cr>", opts)



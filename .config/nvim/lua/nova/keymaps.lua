local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- remap space key to leader
keymap("", "<space>", "<Nop>", opts)

-- Opens file explorer
keymap("n", "<leader>e", ":NvimTreeOpen<cr>", opts)

-- Switch between buffers
keymap("n", "<leader>n", ":BufferNext<cr>", opts)
keymap("n", "<leader>p", ":BufferPrevious<cr>", opts)

-- close current buffer
keymap("n", "<leader>q", ":BufferClose<cr>", opts)

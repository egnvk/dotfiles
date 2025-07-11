vim.g.mapleader = " "

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<C-s>", ":w <CR>", opts)
keymap("i", "jk", "<ESC>", opts)
keymap("n", "<Esc>", ":noh <CR>", opts)

-- Switch between windows
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)

-- Move line
keymap("n", "<leader>j", ":m .+1<CR>==", opts)
keymap("n", "<leader>k", ":m .-2<CR>==", opts)

keymap("n", "<Tab>", ":bnext<CR>", { silent = true })

-- Предыдущий буфер
keymap("n", "<A-Tab>", ":bprevious<CR>", { silent = true })

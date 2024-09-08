vim.opt.wrap = true
vim.opt.mouse = "a"
vim.opt.tabstop = 2
vim.opt.number = true
-- vim.g.loaded_netrw = 1
vim.opt.shiftwidth = 2
-- vim.opt.netrw_browse_split = 0
vim.opt.scrolloff = 10
vim.opt.swapfile = false
vim.opt.expandtab = true
vim.opt.updatetime = 100
vim.opt.ignorecase = true
vim.opt.signcolumn = "yes"
vim.opt.encoding = "utf-8"
-- vim.opt.virtualedit = "block"
vim.opt.termguicolors = true
-- vim.g.loaded_netrwPlugin = 1
-- vim.opt.shortmess:append("sl")
vim.opt.clipboard = "unnamedplus"

-- using the command
-- vim.api.nvim_set_keymap('n', '<leader>z', '<cmd>Centerpad<cr>', { silent = true, noremap = true })

-- or using the lua function
vim.api.nvim_set_keymap('n', '<leader>z', "<cmd>lua require'centerpad'.toggle{ leftpad = 40, rightpad = 40 }<cr>",
  { silent = true, noremap = true })

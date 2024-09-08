require("bufferline").setup({
  options = {
    mode = "buffers", -- buffers or tabs
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
      },
    },
    diagnostics = "nvim_lsp",
    numbers = 'ordinal',

    custom_filter = function(buf_number)
      -- local filetype = vim.bo[buf_number].filetype
      local buf_name = vim.fn.bufname(buf_number)

      -- don't show leftpad and rightpad buffers
      if buf_name == 'leftpad' or buf_name == 'rightpad' then
        return false
      end

      return true
    end
  },
})

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", opts)
keymap("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", opts)
keymap("n", "<leader>x", "<cmd> BufferLinePickClose<CR>", opts)

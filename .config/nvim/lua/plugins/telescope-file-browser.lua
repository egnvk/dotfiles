return {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        extensions = {
          file_browser = {
            hijack_netrw = true,
          },
        },
      })
      require("telescope").load_extension("file_browser")
    end,
    keys = {
      { "<leader>'", "<cmd>Telescope file_browser<cr>", desc = "Telescope File Browser (root dir)" },
      {
        '<leader>"',
        "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>",
        desc = "Telescope File Browser (cwd)",
      },
    },
}

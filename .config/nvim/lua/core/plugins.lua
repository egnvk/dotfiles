local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- color themes
  { "rebelot/kanagawa.nvim",    lazy = false,    name = "kanagawa" },
  {
    "sho-87/kanagawa-paper.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  { "ellisonleao/gruvbox.nvim", priority = 1000, config = true,    opts = ... },
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require 'nordic'.load()
    end
  },
  { "bluz71/vim-moonfly-colors", name = "moonfly",  lazy = false, priority = 1000 },
  { "rose-pine/neovim",          name = "rose-pine" },
  -- { "shaunsingh/nord.nvim" },
  { 'aliqyan-21/darkvoid.nvim' },
  {
    'maxmx03/solarized.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.background = 'dark' -- or 'light'

      vim.cmd.colorscheme 'solarized'
    end,
  },
  { "savq/melange-nvim" },
  {
    'olivercederborg/poimandres.nvim',
    lazy = false,
    priority = 1000,
    -- config = function()
    --   require('poimandres').setup {
    --     -- leave this setup function empty for default config
    --     -- or refer to the configuration section
    --     -- for configuration options
    --   }
    -- end,
  },
  { "kvrohit/rasmus.nvim" },
  {
    "gbprod/nord.nvim",
    lazy = false,
    priority = 1000,
  },
  { "ramojus/mellifluous.nvim" },
  -- centerpad
  { 'smithbm2316/centerpad.nvim' },

  -- gitsigns
  {
    "lewis6991/gitsigns.nvim"
  },

  -- indent block
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- "nvim-telescope/telescope-file-browser.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
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
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "<leader>'", "<cmd>Telescope file_browser<cr>", desc = "Telescope File Browser (root dir)" },
      {
        '<leader>"',
        "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>",
        desc = "Telescope File Browser (cwd)",
      },
    },
  },

  -- lsp
  { "neovim/nvim-lspconfig",               lazy = true },

  -- mason
  { "williamboman/mason.nvim",             lazy = true },

  -- linting
  {
    "stevearc/conform.nvim",
    opts = {},
  },

  -- cmp
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/vim-vsnip" },
  { "hrsh7th/vim-vsnip-integ" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },

  -- nvim treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- neo-tree explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  },

  -- rust syntax highlighting, formatting and LSP settings
  { "rust-lang/rust.vim" },
  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    -- ft = { "rust" },
    lazy = false,
  },

  -- buffer line
  { "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },

  -- toggle terminal
  { "akinsho/toggleterm.nvim", version = "*", config = true },

  -- autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
  },

  -- ts-autotag
  { "windwp/nvim-ts-autotag" },

  -- status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- tact language support
  {
    "tact-lang/tact.vim",
    init = function()
      vim.g.tact_prefer_completefunc = 1
    end,
  },

  -- live server plugin for html, css, js
  {
    "barrett-ruth/live-server.nvim",
    -- build = 'pnpm add -g live-server',
    cmd = { "LiveServerStart", "LiveServerStop" },
    config = true,
  },

  -- image viewer
  -- {
  -- 	"vhyrro/luarocks.nvim",
  -- 	priority = 1001, -- this plugin needs to run before anything else
  -- 	opts = {
  -- 		rocks = { "magick" },
  -- 	},
  -- },
  -- {
  --   "3rd/image.nvim",
  --   dependencies = { "luarocks.nvim" },
  --   config = true,
  -- },
  {
    "edluffy/hologram.nvim"
  },

  -- smart comment
  {
    "numToStr/Comment.nvim",
    -- opts = {
    --   -- add any options here
    -- },
  },
  -- comment for jsx/tsx
  { "JoosepAlviste/nvim-ts-context-commentstring" },

  -- markdown preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  -- viewer color
  { "norcalli/nvim-colorizer.lua" },
  {
    "amitds1997/remote-nvim.nvim",
    version = "*",                     -- Pin to GitHub releases
    dependencies = {
      "nvim-lua/plenary.nvim",         -- For standard functions
      "MunifTanjim/nui.nvim",          -- To build the plugin UI
      "nvim-telescope/telescope.nvim", -- For picking b/w different remote methods
    },
    config = true,
  }
}

require("lazy").setup(plugins)

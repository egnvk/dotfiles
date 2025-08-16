return {
	-- Autotags
	{
		"windwp/nvim-ts-autotag",
		opts = {},
	},

	-- Neovim plugin to improve the default vim.ui interfaces
	-- WARN: deprecated
	{
		"stevearc/dressing.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
		opts = {},
		config = function()
			require("dressing").setup()
		end,
	},
}

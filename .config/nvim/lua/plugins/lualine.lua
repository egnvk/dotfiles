return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		local icon = require("config.icons-2")
		local lualine = require("lualine")

		local darkvoid = {
			colors = {
				bg = "#2e2e2e", -- общий фон (серый)
				fg_active = "#1bfd9c", -- текст активного буфера (зеленый)
				fg_inactive = "#e1e1e1", -- текст неактивного буфера (светло-серый)
				bg_buffer = "#4a4a4a", -- фон для всех буферов
			},
		}
		darkvoid.theme = {
			normal = {
				a = { bg = darkvoid.colors.bg, fg = darkvoid.colors.fg_active, gui = "bold" },
				b = { bg = darkvoid.colors.bg, fg = darkvoid.colors.fg_active }, -- активный буфер: текст зеленый, фон общий
				c = { bg = darkvoid.colors.bg, fg = darkvoid.colors.fg_active },
			},
			insert = {
				a = { bg = darkvoid.colors.bg, fg = "#3cffaf", gui = "bold" },
				b = { bg = darkvoid.colors.bg, fg = "#3cffaf" },
				c = { bg = darkvoid.colors.bg, fg = darkvoid.colors.fg_active },
			},
			visual = {
				a = { bg = darkvoid.colors.bg, fg = "#57ffbe", gui = "bold" },
				b = { bg = darkvoid.colors.bg, fg = "#57ffbe" },
				c = { bg = darkvoid.colors.bg, fg = darkvoid.colors.fg_active },
			},
			replace = {
				a = { bg = darkvoid.colors.bg, fg = "#ff6f6f", gui = "bold" },
				b = { bg = darkvoid.colors.bg, fg = "#ff6f6f" },
				c = { bg = darkvoid.colors.bg, fg = darkvoid.colors.fg_active },
			},
			command = {
				a = { bg = darkvoid.colors.bg, fg = "#ffd166", gui = "bold" },
				b = { bg = darkvoid.colors.bg, fg = "#ffd166" },
				c = { bg = darkvoid.colors.bg, fg = darkvoid.colors.fg_active },
			},
			inactive = {
				a = { bg = darkvoid.colors.bg, fg = darkvoid.colors.fg_inactive },
				b = { bg = darkvoid.colors.bg, fg = darkvoid.colors.fg_inactive }, -- неактивный буфер: текст светло-серый, фон общий
				c = { bg = darkvoid.colors.bg, fg = darkvoid.colors.fg_inactive },
			},
		}

		local filetype = { "filetype", icon_only = true }

		local diagnostics = {
			"diagnostics",
			sources = { "nvim_diagnostic" },
			sections = { "error", "warn", "info", "hint" },
			symbols = {
				error = icon.diagnostics.Error,
				hint = icon.diagnostics.Hint,
				info = icon.diagnostics.Info,
				warn = icon.diagnostics.Warning,
			},
			colored = true,
			update_in_insert = false,
			always_visible = false,
		}

		local diff = {
			"diff",
			source = function()
				local gitsigns = vim.b.gitsigns_status_dict
				if gitsigns then
					return {
						added = gitsigns.added,
						modified = gitsigns.changed,
						removed = gitsigns.removed,
					}
				end
			end,
			symbols = {
				added = icon.git.LineAdded .. " ",
				modified = icon.git.LineModified .. " ",
				removed = icon.git.LineRemoved .. " ",
			},
			colored = true,
			always_visible = false,
		}

		local lsp_status = {
			"lsp_status",
			icon = "", -- f013
			symbols = {
				spinner = icon.spinner,
				done = false,
				separator = " ",
			},
			-- List of LSP names to ignore (e.g., `null-ls`):
			ignore_lsp = {},
		}

		-- local branch = {
		-- 	"branch",
		-- 	color = { fg = darkvoid.colors.fg_inactive, bg = darkvoid.colors.bg },
		-- }

		lualine.setup({
			options = {
				-- theme = darkvoid.theme, -- передаём тему прямо сюда
				globalstatus = true,
				section_separators = "",
				component_separators = "",
				disabled_filetypes = { "mason", "lazy", "NvimTree" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					"branch",
					"buffers",
				},
				lualine_c = { "codecompanion", "supermaven" },
				lualine_x = { "selectioncount", lsp_status, diff, diagnostics, filetype },
				lualine_y = {},
				lualine_z = { "progress", "tabs" },
			},
		})
	end,
}

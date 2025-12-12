return {
	{
		"catppuccin/nvim",
		priority = 150,
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				background = {
					light = "latte",
					dark = "mocha",
				},
				color_overrides = {
					latte = {
						rosewater = "#c14a4a",
						flamingo = "#c14a4a",
						red = "#c14a4a",
						maroon = "#c14a4a",
						pink = "#945e80",
						mauve = "#945e80",
						peach = "#c35e0a",
						yellow = "#b47109",
						green = "#6c782e",
						teal = "#4c7a5d",
						sky = "#4c7a5d",
						sapphire = "#4c7a5d",
						blue = "#45707a",
						lavender = "#45707a",
						text = "#654735",
						subtext1 = "#73503c",
						subtext0 = "#805942",
						overlay2 = "#8c6249",
						overlay1 = "#8c856d",
						overlay0 = "#a69d81",
						surface2 = "#bfb695",
						surface1 = "#d1c7a3",
						surface0 = "#e3dec3",
						base = "#f9f5d7",
						mantle = "#f0ebce",
						crust = "#e8e3c8",
					},
					mocha = {
						rosewater = "#ea6962",
						flamingo = "#ea6962",
						red = "#ea6962",
						maroon = "#ea6962",
						pink = "#d3869b",
						mauve = "#d3869b",
						peach = "#e78a4e",
						yellow = "#d8a657",
						green = "#a9b665",
						teal = "#89b482",
						sky = "#89b482",
						sapphire = "#89b482",
						blue = "#7daea3",
						lavender = "#7daea3",
						text = "#ebdbb2",
						subtext1 = "#d5c4a1",
						subtext0 = "#bdae93",
						overlay2 = "#a89984",
						overlay1 = "#928374",
						overlay0 = "#595959",
						surface2 = "#4d4d4d",
						surface1 = "#404040",
						surface0 = "#292929",
						base = "#1d2021",
						mantle = "#191b1c",
						crust = "#141617",
					},
				},
				transparent_background = true,
				show_end_of_buffer = false,
				integration_default = false,
				no_bold = true,
				no_italic = true,
				no_underline = true,
				integrations = {
					barbecue = { dim_dirname = true, bold_basename = true, dim_context = false, alt_background = false },
					cmp = true,
					gitsigns = true,
					hop = true,
					illuminate = { enabled = true },
					native_lsp = { enabled = true, inlay_hints = { background = true } },
					neogit = true,
					neotree = true,
					semantic_tokens = true,
					treesitter = true,
					treesitter_context = true,
					vimwiki = true,
					which_key = true,
					aerial = true,
					fidget = true,
					mason = true,
					neotest = true,
					dap_ui = true,
					telescope = {
						enabled = true,
						style = "nvchad",
					},
				},
				highlight_overrides = {
					all = function(colors)
						return {
							CmpItemMenu = { fg = colors.surface2 },
							CursorLineNr = { fg = colors.text },
							FloatBorder = { bg = colors.base, fg = colors.surface0 },
							GitSignsChange = { fg = colors.peach },
							LineNr = { fg = colors.overlay0 },
							LspInfoBorder = { link = "FloatBorder" },
							NeoTreeDirectoryIcon = { fg = colors.subtext1 },
							NeoTreeDirectoryName = { fg = colors.subtext1 },
							NeoTreeFloatBorder = { link = "TelescopeResultsBorder" },
							NeoTreeGitConflict = { fg = colors.red },
							NeoTreeGitDeleted = { fg = colors.red },
							NeoTreeGitIgnored = { fg = colors.overlay0 },
							NeoTreeGitModified = { fg = colors.peach },
							NeoTreeGitStaged = { fg = colors.green },
							NeoTreeGitUnstaged = { fg = colors.red },
							NeoTreeGitUntracked = { fg = colors.green },
							NeoTreeIndent = { fg = colors.surface1 },
							NeoTreeNormal = { bg = colors.mantle },
							NeoTreeNormalNC = { bg = colors.mantle },
							NeoTreeRootName = { fg = colors.subtext1, style = { "bold" } },
							NeoTreeTabActive = { fg = colors.text, bg = colors.mantle },
							NeoTreeTabInactive = { fg = colors.surface2, bg = colors.crust },
							NeoTreeTabSeparatorActive = { fg = colors.mantle, bg = colors.mantle },
							NeoTreeTabSeparatorInactive = { fg = colors.crust, bg = colors.crust },
							NeoTreeWinSeparator = { fg = colors.base, bg = colors.base },
							NormalFloat = { bg = colors.base },
							Pmenu = { bg = colors.mantle, fg = "" },
							PmenuSel = { bg = colors.surface0, fg = "" },
							VertSplit = { bg = colors.base, fg = colors.surface0 },
							WhichKeyFloat = { bg = colors.mantle },
							YankHighlight = { bg = colors.surface2 },
							FidgetTask = { fg = colors.subtext1 },
							FidgetTitle = { fg = colors.peach },

							IblIndent = { fg = colors.surface0 },
							IblScope = { fg = colors.overlay0 },

							Boolean = { fg = colors.mauve },
							Number = { fg = colors.mauve },
							Float = { fg = colors.mauve },

							PreProc = { fg = colors.mauve },
							PreCondit = { fg = colors.mauve },
							Include = { fg = colors.mauve },
							Define = { fg = colors.mauve },
							Conditional = { fg = colors.red },
							Repeat = { fg = colors.red },
							Keyword = { fg = colors.red },
							Typedef = { fg = colors.red },
							Exception = { fg = colors.red },
							Statement = { fg = colors.red },

							Error = { fg = colors.red },
							StorageClass = { fg = colors.peach },
							Tag = { fg = colors.peach },
							Label = { fg = colors.peach },
							Structure = { fg = colors.peach },
							Operator = { fg = colors.peach },
							Title = { fg = colors.peach },
							Special = { fg = colors.yellow },
							SpecialChar = { fg = colors.yellow },
							Type = { fg = colors.yellow, style = { "bold" } },
							Function = { fg = colors.green, style = { "bold" } },
							Delimiter = { fg = colors.subtext1 },
							Ignore = { fg = colors.subtext1 },
							Macro = { fg = colors.teal },

							TSAnnotation = { fg = colors.mauve },
							TSAttribute = { fg = colors.mauve },
							TSBoolean = { fg = colors.mauve },
							TSCharacter = { fg = colors.teal },
							TSCharacterSpecial = { link = "SpecialChar" },
							TSComment = { link = "Comment" },
							TSConditional = { fg = colors.red },
							TSConstBuiltin = { fg = colors.mauve },
							TSConstMacro = { fg = colors.mauve },
							TSConstant = { fg = colors.text },
							TSConstructor = { fg = colors.green },
							TSDebug = { link = "Debug" },
							TSDefine = { link = "Define" },
							TSEnvironment = { link = "Macro" },
							TSEnvironmentName = { link = "Type" },
							TSError = { link = "Error" },
							TSException = { fg = colors.red },
							TSField = { fg = colors.blue },
							TSFloat = { fg = colors.mauve },
							TSFuncBuiltin = { fg = colors.green },
							TSFuncMacro = { fg = colors.green },
							TSFunction = { fg = colors.green },
							TSFunctionCall = { fg = colors.green },
							TSInclude = { fg = colors.red },
							TSKeyword = { fg = colors.red },
							TSKeywordFunction = { fg = colors.red },
							TSKeywordOperator = { fg = colors.peach },
							TSKeywordReturn = { fg = colors.red },
							TSLabel = { fg = colors.peach },
							TSLiteral = { link = "String" },
							TSMath = { fg = colors.blue },
							TSMethod = { fg = colors.green },
							TSMethodCall = { fg = colors.green },
							TSNamespace = { fg = colors.yellow },
							TSNone = { fg = colors.text },
							TSNumber = { fg = colors.mauve },
							TSOperator = { fg = colors.peach },
							TSParameter = { fg = colors.text },
							TSParameterReference = { fg = colors.text },
							TSPreProc = { link = "PreProc" },
							TSProperty = { fg = colors.blue },
							TSPunctBracket = { fg = colors.text },
							TSPunctDelimiter = { link = "Delimiter" },
							TSPunctSpecial = { fg = colors.blue },
							TSRepeat = { fg = colors.red },
							TSStorageClass = { fg = colors.peach },
							TSStorageClassLifetime = { fg = colors.peach },
							TSStrike = { fg = colors.subtext1 },
							TSString = { fg = colors.teal },
							TSStringEscape = { fg = colors.green },
							TSStringRegex = { fg = colors.green },
							TSStringSpecial = { link = "SpecialChar" },
							TSSymbol = { fg = colors.text },
							TSTag = { fg = colors.peach },
							TSTagAttribute = { fg = colors.green },
							TSTagDelimiter = { fg = colors.green },
							TSText = { fg = colors.green },
							TSTextReference = { link = "Constant" },
							TSTitle = { link = "Title" },
							TSTodo = { link = "Todo" },
							TSType = { fg = colors.yellow, style = { "bold" } },
							TSTypeBuiltin = { fg = colors.yellow, style = { "bold" } },
							TSTypeDefinition = { fg = colors.yellow, style = { "bold" } },
							TSTypeQualifier = { fg = colors.peach, style = { "bold" } },
							TSURI = { fg = colors.blue },
							TSVariable = { fg = colors.text },
							TSVariableBuiltin = { fg = colors.mauve },

							["@annotation"] = { link = "TSAnnotation" },
							["@attribute"] = { link = "TSAttribute" },
							["@boolean"] = { link = "TSBoolean" },
							["@character"] = { link = "TSCharacter" },
							["@character.special"] = { link = "TSCharacterSpecial" },
							["@comment"] = { link = "TSComment" },
							["@conceal"] = { link = "Grey" },
							["@conditional"] = { link = "TSConditional" },
							["@constant"] = { link = "TSConstant" },
							["@constant.builtin"] = { link = "TSConstBuiltin" },
							["@constant.macro"] = { link = "TSConstMacro" },
							["@constructor"] = { link = "TSConstructor" },
							["@debug"] = { link = "TSDebug" },
							["@define"] = { link = "TSDefine" },
							["@error"] = { link = "TSError" },
							["@exception"] = { link = "TSException" },
							["@field"] = { link = "TSField" },
							["@float"] = { link = "TSFloat" },
							["@function"] = { link = "TSFunction" },
							["@function.builtin"] = { link = "TSFuncBuiltin" },
							["@function.call"] = { link = "TSFunctionCall" },
							["@function.macro"] = { link = "TSFuncMacro" },
							["@include"] = { link = "TSInclude" },
							["@keyword"] = { link = "TSKeyword" },
							["@keyword.function"] = { link = "TSKeywordFunction" },
							["@keyword.operator"] = { link = "TSKeywordOperator" },
							["@keyword.return"] = { link = "TSKeywordReturn" },
							["@label"] = { link = "TSLabel" },
							["@math"] = { link = "TSMath" },
							["@method"] = { link = "TSMethod" },
							["@method.call"] = { link = "TSMethodCall" },
							["@namespace"] = { link = "TSNamespace" },
							["@none"] = { link = "TSNone" },
							["@number"] = { link = "TSNumber" },
							["@operator"] = { link = "TSOperator" },
							["@parameter"] = { link = "TSParameter" },
							["@parameter.reference"] = { link = "TSParameterReference" },
							["@preproc"] = { link = "TSPreProc" },
							["@property"] = { link = "TSProperty" },
							["@punctuation.bracket"] = { link = "TSPunctBracket" },
							["@punctuation.delimiter"] = { link = "TSPunctDelimiter" },
							["@punctuation.special"] = { link = "TSPunctSpecial" },
							["@repeat"] = { link = "TSRepeat" },
							["@storageclass"] = { link = "TSStorageClass" },
							["@storageclass.lifetime"] = { link = "TSStorageClassLifetime" },
							["@strike"] = { link = "TSStrike" },
							["@string"] = { link = "TSString" },
							["@string.escape"] = { link = "TSStringEscape" },
							["@string.regex"] = { link = "TSStringRegex" },
							["@string.special"] = { link = "TSStringSpecial" },
							["@symbol"] = { link = "TSSymbol" },
							["@tag"] = { link = "TSTag" },
							["@tag.attribute"] = { link = "TSTagAttribute" },
							["@tag.delimiter"] = { link = "TSTagDelimiter" },
							["@text"] = { link = "TSText" },
							["@text.danger"] = { link = "TSDanger" },
							["@text.diff.add"] = { link = "diffAdded" },
							["@text.diff.delete"] = { link = "diffRemoved" },
							["@text.emphasis"] = { link = "TSEmphasis" },
							["@text.environment"] = { link = "TSEnvironment" },
							["@text.environment.name"] = { link = "TSEnvironmentName" },
							["@text.literal"] = { link = "TSLiteral" },
							["@text.math"] = { link = "TSMath" },
							["@text.note"] = { link = "TSNote" },
							["@text.reference"] = { link = "TSTextReference" },
							["@text.strike"] = { link = "TSStrike" },
							["@text.strong"] = { link = "TSStrong" },
							["@text.title"] = { link = "TSTitle" },
							["@text.todo"] = { link = "TSTodo" },
							["@text.todo.checked"] = { link = "Green" },
							["@text.todo.unchecked"] = { link = "Ignore" },
							["@text.underline"] = { link = "TSUnderline" },
							["@text.uri"] = { link = "TSURI" },
							["@text.warning"] = { link = "TSWarning" },
							["@todo"] = { link = "TSTodo" },
							["@type"] = { link = "TSType" },
							["@type.builtin"] = { link = "TSTypeBuiltin" },
							["@type.definition"] = { link = "TSTypeDefinition" },
							["@type.qualifier"] = { link = "TSTypeQualifier" },
							["@uri"] = { link = "TSURI" },
							["@variable"] = { link = "TSVariable" },
							["@variable.builtin"] = { link = "TSVariableBuiltin" },

							["@lsp.type.class"] = { link = "TSType" },
							["@lsp.type.comment"] = { link = "TSComment" },
							["@lsp.type.decorator"] = { link = "TSFunction" },
							["@lsp.type.enum"] = { link = "TSType" },
							["@lsp.type.enumMember"] = { link = "TSProperty" },
							["@lsp.type.events"] = { link = "TSLabel" },
							["@lsp.type.function"] = { link = "TSFunction" },
							["@lsp.type.interface"] = { link = "TSType" },
							["@lsp.type.keyword"] = { link = "TSKeyword" },
							["@lsp.type.macro"] = { link = "TSConstMacro" },
							["@lsp.type.method"] = { link = "TSMethod" },
							["@lsp.type.modifier"] = { link = "TSTypeQualifier" },
							["@lsp.type.namespace"] = { link = "TSNamespace" },
							["@lsp.type.number"] = { link = "TSNumber" },
							["@lsp.type.operator"] = { link = "TSOperator" },
							["@lsp.type.parameter"] = { link = "TSParameter" },
							["@lsp.type.property"] = { link = "TSProperty" },
							["@lsp.type.regexp"] = { link = "TSStringRegex" },
							["@lsp.type.string"] = { link = "TSString" },
							["@lsp.type.struct"] = { link = "TSType" },
							["@lsp.type.type"] = { link = "TSType" },
							["@lsp.type.typeParameter"] = { link = "TSTypeDefinition" },
							["@lsp.type.variable"] = { link = "TSVariable" },
						}
					end,
					latte = function(colors)
						return {
							IblIndent = { fg = colors.mantle },
							IblScope = { fg = colors.surface1 },

							LineNr = { fg = colors.surface1 },
						}
					end,
				},
			})
			vim.api.nvim_set_hl(0, "NavicIconsOperator", { default = true, bg = "none", fg = "#eedaad" })
			vim.api.nvim_set_hl(0, "NavicText", { default = true, bg = "none", fg = "#eedaad" })
			vim.api.nvim_set_hl(0, "NavicSeparator", { default = true, bg = "none", fg = "#eedaad" })

			-- vim.api.nvim_command("colorscheme catppuccin")
		end,
	},
	{
		"sainnhe/gruvbox-material",
		enabled = true,
		priority = 1000,
		config = function()
			vim.g.gruvbox_material_transparent_background = 1
			vim.g.gruvbox_material_foreground = "mix"
			vim.g.gruvbox_material_background = "soft"
			vim.g.gruvbox_material_ui_contrast = "soft"
			vim.g.gruvbox_material_float_style = "bright"
			vim.g.gruvbox_material_statusline_style = "mix" -- "mix", "original", "afterglow"
			vim.g.gruvbox_material_cursor = "auto"

			-- vim.g.gruvbox_material_colors_override = { bg0 = '#16181A' } -- #0e1010
			vim.g.gruvbox_material_better_performance = 1

			-- vim.cmd.colorscheme("gruvbox-material")
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				transparent = true,
				styles = {
					comments = { italic = false },
					keywords = { italic = false },
					functions = {},
					variables = {},
					sidebars = "dark",
					floats = "dark",
				},
			})

			-- vim.cmd.colorscheme("tokyonight-moon")
		end,
	},
	{
		"oxfist/night-owl.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			-- vim.cmd.colorscheme("night-owl")
		end,
	},
	{
		"ramojus/mellifluous.nvim",
		-- version = "v0.*", -- uncomment for stable config (some features might be missed if/when v1 comes out)
		config = function()
			-- require("mellifluous").setup({
			-- 	transparent = true,
			-- })

			-- vim.cmd("colorscheme mellifluous")
		end,
	},
	{
		"xero/miasma.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.cmd("colorscheme miasma")
		end,
	},
	{
		"dgox16/oldworld.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("oldworld").setup({
				styles = {
					booleans = { italic = true, bold = true },
				},
				integrations = {
					-- hop = true,
					telescope = false,
				},
			})
			-- vim.cmd("colorscheme oldworld")
		end,
	},
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		opts = function()
			return {
				transparent = true,
			}
		end,

		config = function()
			-- vim.cmd("colorscheme solarized-osaka")
		end,
	},
	{
		"webhooked/kanso.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			background = "zen",
		},
		config = function()
			-- vim.cmd("colorscheme kanso-zen")
			-- require("kanso").load("zen")
			-- require("kanso")
		end,
	},
	{
		"sainnhe/everforest",
		lazy = false,
		priority = 1000,
		config = function()
			-- Optionally configure and load the colorscheme
			-- directly inside the plugin declaration.
			vim.g.everforest_enable_italic = true
			vim.g.everforest_transparent_background = 1
			-- vim.cmd.colorscheme("everforest")
		end,
	},
	{
		"olivercederborg/poimandres.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("poimandres").setup({
				-- leave this setup function empty for default config
				-- or refer to the configuration section
				-- for configuration options
				disable_background = true, -- disable background
			})
		end,

		-- optionally set the colorscheme within lazy config
		init = function()
			-- vim.cmd("colorscheme poimandres")
		end,
	},
	{
		"armannikoyan/rusty",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
			italic_comments = true,
			underline_current_line = true,
			-- colors = {
			-- 	foreground = "#c5c8c6",
			-- 	background = "#1d1f21",
			-- 	selection = "#373b41",
			-- 	line = "#282a2e",
			-- 	comment = "#969896",
			-- 	red = "#cc6666",
			-- 	orange = "#de935f",
			-- 	yellow = "#f0c674",
			-- 	green = "#b5bd68",
			-- 	aqua = "#8abeb7",
			-- 	blue = "#81a2be",
			-- 	purple = "#b294bb",
			-- 	window = "#4d5057",
			-- },
		},
		config = function(_, opts)
			-- require("rusty").setup(opts)
			-- vim.cmd("colorscheme rusty")
		end,
	},
	{
		"tiagovla/tokyodark.nvim",
		opts = {
			transparent_background = true,
		},
		config = function(_, opts)
			require("tokyodark").setup(opts) -- calling setup is optional
			-- vim.cmd([[colorscheme tokyodark]])
		end,
	},
	{
		"eldritch-theme/eldritch.nvim",
		lazy = false,
		priority = 1000,

		opts = {
			transparent = true,
		},

		config = function(_, opts)
			require("eldritch").setup(opts)
			-- vim.cmd([[colorscheme eldritch]])
		end,
	},
	{
		"bluz71/vim-nightfly-colors",
		name = "nightfly",
		lazy = false,
		priority = 1000,

		config = function(_)
			-- vim.cmd([[colorscheme nightfly]])
			-- vim.g.nightflyTransparent = true
		end,
	},
	{
		"shaunsingh/nord.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.nord_disable_background = true
			-- vim.cmd.colorscheme("nord")
		end,
	},
	{
		"Tsuzat/NeoSolarized.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- vim.cmd([[ colorscheme NeoSolarized ]])
		end,
	},
	{
		"aliqyan-21/darkvoid.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("darkvoid").setup({
				transparent = true,
				glow = false,
				show_end_of_buffer = true,

				colors = {
					plugins = {
						gitsigns = true,
						nvim_cmp = true,
						treesitter = true,
						nvimtree = true,
						telescope = true,
						lualine = false, -- here make lualine support off and you are good to go.
						bufferline = true,
						oil = true,
						whichkey = true,
						nvim_notify = true,
					},
				},
			})

			-- vim.cmd([[ colorscheme darkvoid ]])
			vim.cmd([[
				highlight! LualineNormal guibg=none
				highlight! LualineInsert guibg=none
				highlight! LualineVisual guibg=none
				highlight! LualineReplace guibg=none
				highlight! LualineCommand guibg=none
				highlight! LualineInactive guibg=none
			]])
		end,
	},
	{
		"vague-theme/vague.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other plugins
		config = function()
			-- NOTE: you do not need to call setup if you don't want to.
			require("vague").setup({
				transparent = true,
			})
			-- vim.cmd("colorscheme vague")
		end,
	},
	{
		"embark-theme/vim",
		lazy = false,
		priority = 1000,
		name = "embark",
		config = function()
			-- require("embark").setup({
			-- 	transparent = true,
			-- })

			-- vim.cmd.colorscheme("embark")
			-- vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
		end,
	},
	{
		"deparr/tairiki.nvim",
		lazy = false,
		priority = 1000, -- recommended if you use tairiki as your default theme
		config = function()
			require("tairiki").setup({
				palette = "dimmed", -- main palette, available options: dark, light, dimmed, tomorrow, light_legacy
				default_dark = "dark",
				default_light = "light",
				transparent = true,
			})

			-- vim.cmd.colorscheme("tairiki")
		end,
	},
	{
		"mcauley-penney/techbase.nvim",
		config = function(_, opts)
			-- vim.cmd.colorscheme("techbase")
		end,
		priority = 1000,
	},

	{
		"kuri-sun/yoda.nvim",
		-- config = function(_, opts)
		-- 	require("yoda").setup({
		-- 		-- Set light or dark variant
		-- 		theme = "dark", -- "dark" or "light"
		--
		-- 		-- Style options
		-- 		italic_comments = true,
		-- 		transparent_background = true,
		-- 	})
		-- end,
		priority = 1000,
	},
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,

		config = function(_, opts)
			require("cyberdream").setup({
				-- Set light or dark variant
				variant = "dark", -- use "light" for the light variant. Also accepts "auto" to set dark or light colors based on the current value of `vim.o.background`

				-- Enable transparent background
				transparent = true,
			})

			-- vim.cmd("colorscheme cyberdream")
		end,
	},
	{
		"adibhanna/yukinord.nvim",
		priority = 1000,
		config = function()
			require("yukinord").setup({
				transparent = true, -- Enable transparent background
				transparent_sidebar = true, -- Enable transparent background for sidebars (NvimTree, terminal, etc.)
			})

			-- vim.cmd([[colorscheme yukinord]])
		end,
	},

	{
		"nendix/zen.nvim",
		lazy = false,
		priority = 1000,

		config = function()
			require("zen").setup({
				variant = "dark", -- "dark" or "light"
				undercurl = true,
				transparent = true,
			})

			-- vim.cmd.colorscheme("zen")
		end,
	},
	{
		"metalelf0/black-metal-theme-neovim",
		lazy = false,
		priority = 1000,
		config = function()
			require("black-metal").setup({
				-- optional configuration here
				-- Can be one of: bathory | burzum | dark-funeral | darkthrone | emperor | gorgoroth | immortal | impaled-nazarene | khold | marduk | mayhem | nile | taake | thyrfing | venom | windir
				theme = "bathory",
				transparent = true,
			})
			require("black-metal").load()
		end,
	},
}

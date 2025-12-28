local set = vim.opt

set.mouse = "a"
set.number = true
set.scrolloff = 10
set.clipboard = "unnamedplus"

set.termguicolors = true

set.tabstop = 2
set.shiftwidth = 2

set.swapfile = false
set.sessionoptions:remove("blank")

set.splitbelow = true -- force all horizontal splits to go below current window
set.splitright = true
set.breakindent = true -- wrap lines with i
set.signcolumn = "yes:1"

local get_option = vim.filetype.get_option
vim.filetype.get_option = function(filetype, option)
	return option == "commentstring" and require("ts_context_commentstring.internal").calculate_commentstring()
		or get_option(filetype, option)
end

vim.filetype.add({
	extension = {
		-- env = "dotenv",
		-- env = "sh",
		env = "dosini",
	},
	filename = {
		-- [".env"] = "dotenv",
		-- ["env"] = "dotenv",
		-- [".env"] = "sh",
		-- ["env"] = "sh",
		[".env"] = "dosini",
		["env"] = "dosini",
	},
	pattern = {
		["[jt]sconfig.*.json"] = "jsonc",
		-- ["%.env%.[%w_.-]+"] = "dotenv",
		-- ["%.env%.[%w_.-]+"] = "sh",
		["%.env%.[%w_.-]+"] = "dosini",
	},
})

local set = vim.opt

set.mouse = "a"
set.number = true
set.scrolloff = 10
set.clipboard = "unnamedplus"

set.termguicolors = true

set.tabstop = 2
set.shiftwidth = 2

set.swapfile = false

set.splitbelow = true  -- force all horizontal splits to go below current window
set.splitright = true
set.breakindent = true -- wrap lines with i
set.signcolumn = "yes:1"

local get_option = vim.filetype.get_option
vim.filetype.get_option = function(filetype, option)
	return option == "commentstring"
			and require("ts_context_commentstring.internal").calculate_commentstring()
			or get_option(filetype, option)
end

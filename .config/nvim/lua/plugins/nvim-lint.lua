return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		-- Configure custom linters using Mason-managed tools
		local mason_bin_dir = vim.fn.stdpath("data") .. "/mason/bin"

		-- Customize golangcilint to ignore exit codes (golangci-lint exits with code 1-3 when issues are found)
		local golangcilint = require("lint").linters.golangcilint
		golangcilint.ignore_exitcode = true

		-- Configure Laravel Pint for linting (using --test mode)
		local pint_cmd = vim.fn.executable(mason_bin_dir .. "/pint") == 1 and mason_bin_dir .. "/pint" or "pint"

		lint.linters.pint = {
			cmd = pint_cmd,
			stdin = false,
			args = { "--test" },
			stream = "stderr", -- Pint outputs diagnostics to stderr
			ignore_exitcode = true,
			parser = function(output, bufnr)
				local diagnostics = {}

				if not output or output == "" then
					return diagnostics
				end

				-- Check if output contains style issues
				-- Pint outputs human-readable format by default when there are issues
				if string.find(output, "FAIL") or string.find(output, "differs") then
					table.insert(diagnostics, {
						lnum = 0,
						col = 0,
						message = "Code style issues found - run formatter to fix",
						severity = vim.diagnostic.severity.WARN,
						source = "pint",
					})
				end

				return diagnostics
			end,
		}
		lint.linters.sqlfluff = {
			cmd = "sqlfluff",
			args = {
				"lint",
				"--format=json",
				-- note: users will have to replace the --dialect argument accordingly
				-- "--dialect=clickhouse",
			},
			ignore_exitcode = true,
			stdin = false,
			parser = function(output, _)
				local per_filepath = {}
				if #output > 0 then
					local status, decoded = pcall(vim.json.decode, output)
					if not status then
						per_filepath = {
							{
								filepath = "stdin",
								violations = {
									{
										source = "sqlfluff",
										line_no = 1,
										line_pos = 1,
										code = "jsonparsingerror",
										description = output,
									},
								},
							},
						}
					else
						per_filepath = decoded
					end
				end
				local diagnostics = {}
				for _, i_filepath in ipairs(per_filepath) do
					for _, violation in ipairs(i_filepath.violations) do
						table.insert(diagnostics, {
							source = "sqlfluff",
							lnum = violation.line_no - 1,
							col = violation.line_pos - 1,
							severity = vim.diagnostic.severity.ERROR,
							message = violation.description,
							user_data = { lsp = { code = violation.code } },
						})
					end
				end
				return diagnostics
			end,
		}

		lint.linters.eslint_d = require("lint.util").wrap(lint.linters.eslint_d, function(diagnostic)
			-- try to ignore "No ESLint configuration found" error
			-- if diagnostic.message:find("Error: No ESLint configuration found") then -- old version
			-- update: 20240814, following is working
			if diagnostic.message:find("Error: Could not find config file") then
				return nil
			end
			return diagnostic
		end)

		-- Configure linters by filetype (using Mason-managed tools)
		lint.linters_by_ft = {
			-- Go
			go = { "golangcilint" },

			-- JavaScript/TypeScript
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },

			-- Lua
			lua = { "luacheck" },

			-- Shell
			sh = { "shellcheck" },
			bash = { "shellcheck" },
			zsh = { "shellcheck" },

			-- SQL
			sql = { "sqlfluff" },

			-- python = { "flake8", "mypy" },
			-- rust = { "clippy" },
		}

		-- Auto-lint on save and text changes
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				-- Only lint if linters are available for this filetype
				local linters = lint.linters_by_ft[vim.bo.filetype]
				if linters and #linters > 0 then
					lint.try_lint()
				end
			end,
		})

		-- Manual linting command
		vim.keymap.set("n", "<leader>ll", function()
			lint.try_lint()
			vim.notify("Linting...", vim.log.levels.INFO, { title = "nvim-lint" })
		end, { desc = "Trigger linting for current file" })

		-- Show linter status
		vim.keymap.set("n", "<leader>li", function()
			local linters = lint.linters_by_ft[vim.bo.filetype] or {}
			if #linters == 0 then
				print("No linters configured for filetype: " .. vim.bo.filetype)
			else
				print("Linters for " .. vim.bo.filetype .. ": " .. table.concat(linters, ", "))

				-- Show which tools are being used
				if vim.bo.filetype == "php" then
					if string.find(pint_cmd, "mason") then
						print("Using Mason pint: " .. pint_cmd)
					else
						print("Using system pint: " .. pint_cmd)
					end
				end
			end
		end, { desc = "Show available linters for current filetype" })
	end,
}

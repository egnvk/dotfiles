local builtin = require("telescope.builtin")


require("telescope").setup({
        extensions = {
                -- fuzzy founder
                fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                },
        },
})

require("telescope").load_extension("fzf")
require("telescope").load_extension("file_browser")

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

return {
	"norcalli/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup({
			"*",              -- Подключает подсветку для всех типов файлов
		}, {
			mode = "background", -- Режим подсветки (background — стандартный)
			-- names = true, -- Отключает поддержку имен цветов (например, "blue")
		})
	end,
}

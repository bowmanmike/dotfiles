return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	-- lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			theme = "onedark",
		},
		sections = {
			lualine_x = { "aerial", "filetype" },
		},
	},
}

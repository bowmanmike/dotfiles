return {
	"OXY2DEV/markview.nvim",
	enabled = vim.loop.os_uname().sysname == "Darwin",
	lazy = false,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local presets = require("markview.presets")
		require("markview").setup({
			hybrid_modes = { "n", "i" },
			preview = {
				enable = false,
			},
			checkboxes = presets.checkboxes.nerd,
			headings = presets.headings.marker,
		})

		require("markview.extras.editor").setup()
	end,
}

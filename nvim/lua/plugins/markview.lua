return {
	"OXY2DEV/markview.nvim",
	enabled = false,
	lazy = false,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local presets = require("markview.presets")
		require("markview").setup({
			hybrid_modes = { "n" },
			checkboxes = presets.checkboxes.nerd,
			headings = presets.headings.marker,
		})

		require("markview.extras.editor").setup()
	end,
}

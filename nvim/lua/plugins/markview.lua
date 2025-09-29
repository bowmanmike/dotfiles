return {
	"OXY2DEV/markview.nvim",
	enabled = vim.loop.os_uname().sysname == "Darwin",
	ft = { "markdown" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local presets = require("markview.presets")
		require("markview").setup({
			preview = {
				enable = false,
				hybrid_modes = { "n", "i" },
			},
			markdown = {
				checkboxes = presets.checkboxes.nerd,
				headings = presets.headings.marker,
			},
		})

		require("markview.extras.editor").setup()
	end,
}

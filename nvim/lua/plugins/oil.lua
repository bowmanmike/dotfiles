return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	config = function()
		-- NOTE: Not sure why this is required here but not for other plugins
		--       If we don't populate the `config` field in the plugin spec,
		--       it calls the setup function by default.
		--       Since we're overriding the `config` field, we need to manually call setup
		require("oil").setup({
			view_options = {
				show_hidden = true,
			},
		})

		vim.keymap.set(
			"n",
			"-",
			"<CMD>Oil --float<CR>",
			{ desc = "Open parent directory", noremap = true, silent = true }
		)
	end,
}

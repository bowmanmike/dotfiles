return {
	{
		"tpope/vim-fugitive",
		lazy = false,
		config = function()
			vim.keymap.set(
				"n",
				"<leader>gs",
				"<cmd>Git<cr>",
				{ silent = true, noremap = true, desc = "Fugitive Status" }
			)
		end,
	},
	{ "tpope/vim-rhubarb", lazy = false },
	{ "tpope/vim-surround", lazy = false },
	{ "tpope/vim-repeat", lazy = false },
	{ "tpope/vim-sleuth", lazy = false },
	{ "tpope/vim-rails", lazy = false },
}

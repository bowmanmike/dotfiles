return {
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set(
				"n",
				"<leader>gs",
				"<cmd>Git<cr>",
				{ silent = true, noremap = true, desc = "Fugitive Status" }
			)
		end,
	},
	{ "tpope/vim-rhubarb" },
	{ "tpope/vim-surround" },
	{ "tpope/vim-repeat" },
	{ "tpope/vim-sleuth" },
	{ "tpope/vim-rails" },
}

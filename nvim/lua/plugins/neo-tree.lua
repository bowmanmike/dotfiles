return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	opts = {
		close_if_last_window = true,
		filesystem = {
			filtered_items = {
				visible = true,
				hide_dotfiles = false,
				hide_gitignored = false,
			},
			follow_current_file = { enabled = true },
		},
	},
	keys = {
		{
			"<c-n>",
			"<cmd>Neotree toggle filesystem reveal left<cr>",
			{ noremap = true, silent = true, desc = "Toggle NeoTree" },
		},
		{ "<leader>n", "<cmd>Neotree reveal<CR>", { noremap = true, silent = true } },
	},
}

return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignored = false,
				},
			},
		})
		vim.keymap.set("n", "<c-n>", ":Neotree toggle filesystem reveal left<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>n", ":Neotree reveal<CR>", { noremap = true, silent = true })
	end,
}

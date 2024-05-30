return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<c-n>", ":Neotree toggle filesystem reveal left<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>n", ":Neotree reveal<CR>", { noremap = true, silent = true })
	end,
}

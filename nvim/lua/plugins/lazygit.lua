return {
	"kdheepak/lazygit.nvim",
	-- optional for floating window border decoration
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>gg", "<cmd>LazyGit<CR>", desc = "Open LazyGit" },
	},
	-- config = function()
	-- 	vim.keymap.set("n", "<leader>gg", vim.cmd.LazyGit, { silent = true, noremap = true, desc = "Open LazyGit" })
	-- end,
}

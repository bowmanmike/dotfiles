return {
	"vim-test/vim-test",
	lazy = false,
	config = function()
		vim.cmd([[ let test#strategy="neovim"]])
	end,
	keys = {
		{ "<leader>tn", ":TestNearest<cr>", desc = "[T]est [N]earest" },
		{ "<leader>tf", ":TestFile<cr>", desc = "[T]est [F]ile" },
		{ "<leader>tl", ":TestLast<cr>", desc = "[T]est [L]ast" },
		{ "<leader>ts", ":TestSuite<cr>", desc = "[T]est [S]uite" },
		{ "<leader>tv", ":TestVisit<cr>", desc = "[T]est [v]isit" },
	},
}

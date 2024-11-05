return {
	"stevearc/aerial.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {},
	cmd = { "AerialToggle" },
	-- config = function()
	-- 	require("aerial").setup({
	-- 		-- on_attach = function(bufnr)
	-- 		-- 	vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
	-- 		-- 	vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
	-- 		-- end,
	--
	-- 		vim.keymap.set("n", "<leader>ae", "<cmd>AerialToggle!<CR>"),
	-- 	})
	-- end,
	keys = {
		{ "<leader>ae", "<cmd>AerialToggle<CR>" },
	},
}

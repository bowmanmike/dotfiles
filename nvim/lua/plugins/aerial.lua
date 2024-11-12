return {
	"stevearc/aerial.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		layout = {
			max_width = { 200, 0.2 },
			min_width = 30,
		},
	},
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

return {
	"smoka7/hop.nvim",
	event = "BufReadPre",
	version = "*",
	-- keys = {
	-- 	{ "s", mode = { "n", "x", "o" }, desc = "Hop Word" },
	-- 	{ "S", mode = { "n", "x", "o" }, desc = "Hop Char2" },
	-- },
	config = function()
		require("hop").setup()
		vim.keymap.set("n", "s", vim.cmd.HopWord, { silent = true, noremap = true })
		vim.keymap.set("n", "S", vim.cmd.HopChar2, { silent = true, noremap = true })
	end,
	opts = {},
}

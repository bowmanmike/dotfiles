return {
	"smoka7/hop.nvim",
	enabled = true,
	version = "*",
	config = function()
		require("hop").setup()
		vim.keymap.set("n", "s", vim.cmd.HopWord, { silent = true, noremap = true })
		vim.keymap.set("n", "S", vim.cmd.HopChar2, { silent = true, noremap = true })
	end,
	opts = {},
}

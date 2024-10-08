return {
	"ggandor/flit.nvim",
	enabled = false,
	dependencies = {
		"ggandor/leap.nvim",
		"tpope/vim-repeat",
	},
	config = function()
		require("flit").setup()
	end,
}

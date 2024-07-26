return {
	"ggandor/flit.nvim",
	dependencies = {
		"ggandor/leap.nvim",
		"tpope/vim-repeat",
	},
	config = function()
		require("flit").setup()
	end,
}

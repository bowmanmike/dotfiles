return {
	"nvChad/nvim-colorizer.lua",
	event = "VeryLazy",
	config = function()
		require("colorizer").setup({
			user_default_options = {
				tailwind = true,
				css = true,
				css_fn = true,
			},
		})
	end,
}

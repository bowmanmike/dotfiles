return {
	"nvimtools/none-ls.nvim",
	event = "VeryLazy",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- null_ls.builtins.diagnostics.erb_lint,
				-- null_ls.builtins.diagnostics.rubocop,
			},
		})
	end,
}

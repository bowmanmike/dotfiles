local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	sources = {
		formatting.prettierd.with({ filetypes = { "html", "css" } }),
		formatting.shfmt,
		formatting.stylua,
		diagnostics.luacheck,
		diagnostics.markdownlint,
	},
	-- debug = true,
})

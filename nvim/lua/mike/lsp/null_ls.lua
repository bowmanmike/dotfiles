-- local utils = require("mike.utils")
local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

-- figure this out later
-- local eslint_d_diagnostics = utls.table_merge(diagnostics.eslint_d, {"svelte"})

-- utils.dump(formatting.prettierd)
null_ls.setup({
	sources = {
		formatting.prettierd.with({ filetypes = { "html", "css" } }),
		formatting.shfmt,
		formatting.eslint_d.with({
			condition = function(utils)
				return not utils.root_matches("Enlistly")
			end,
		}),
		formatting.standardrb,
		formatting.stylua,
		formatting.rustywind.with({
			filetypes = { "html", "css", "javacsript", "javascriptreact", "typescript", "typescriptreact" },
		}),
		formatting.prettierd.with({
			condition = function(utils)
				return utils.root_matches("Enlistly")
			end,
		}),
    formatting.stylelint,
		diagnostics.eslint_d.with({
			condition = function(utils)
				return not utils.root_matches("Enlistly")
			end,
		}),

		-- diagnostics.eslint_d.with({ filetypes = { "svelte" } }),
		diagnostics.luacheck,
		diagnostics.markdownlint,
		diagnostics.standardrb,
    -- diagnostics.stylelint
	},
	-- debug = true,
})

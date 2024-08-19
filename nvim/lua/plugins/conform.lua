return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			-- Customize or remove this keymap to your liking
			"<leader>lf",
			function()
				require("conform").format({ async = false, lsp_fallback = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	-- Everything in opts will be passed to setup()
	opts = {
		-- Define your formatters
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { { "prettierd" } },
			typescript = { { "prettierd" } },
			javascriptreact = { { "prettierd" } },
			typescriptreact = { { "prettierd" } },
			handlebars = { { "prettierd" } },
			-- ruby = { "standardrb" },
			-- eruby = { "erb_format" },
			go = { "goimports" },
			rust = { "rustfmt" },
			json = { "jq" },
		},
		-- Set up format-on-save
		format_on_save = { async = false, timeout_ms = 500, lsp_fallback = true },
		-- Customize formatters
		formatters = {
			shfmt = {
				prepend_args = { "-i", "2" },
			},
		},
	},
	init = function()
		-- If you want the formatexpr, here is the place to set it
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}

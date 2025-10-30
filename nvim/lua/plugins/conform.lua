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
			javascript = { "biome", "prettierd" },
			typescript = { "biome", "prettierd" },
			javascriptreact = { "biome", "prettierd" },
			typescriptreact = { "biome", "prettierd" },
			handlebars = { "prettierd" },
			-- ruby = { "standardrb" },
			-- eruby = { "erb_format" },
			go = { "goimports" },
			rust = { "rustfmt" },
			json = { "jq" },
			markdown = { "deno_fmt" },
			ruby = { "syntax_tree" },
			-- elixir = { "lsp" },
		},
		-- Set up format-on-save
		format_on_save = { async = false, timeout_ms = 500, lsp_fallback = false },
		-- Customize formatters
		formatters = {
			shfmt = {
				prepend_args = { "-i", "2" },
			},
			elixir = { lsp_fallback = true },
			-- Rather than configuring it here, we can use a `~/.streerc` file
			-- syntax_tree = {
			-- 	append_args = { (is_gifthealth and "--plugins=plugin/single_quotes") or "" },
			-- },
		},
	},
	init = function()
		-- If you want the formatexpr, here is the place to set it
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}

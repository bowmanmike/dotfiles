return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		-- config = function()
		-- 	require("mason-lspconfig").setup({
		-- 		ensure_installed = {
		-- 			"astro",
		-- 			"denols",
		-- 			"emmet_ls",
		-- 			"eslint",
		-- 			-- "gopls",
		-- 			"jsonls",
		-- 			-- "lua_ls",
		-- 			-- DO NOT USE MASON TO INSTALL RUBY_LSP, IT'S BROKEN
		-- 			-- https://shopify.github.io/ruby-lsp/editors.html#neovim
		-- 			-- "ruby_lsp",
		-- 			-- "rust_analyzer",
		-- 			-- "solargraph",
		-- 			-- "sorbet",
		-- 			"tailwindcss",
		-- 			-- "templ",
		-- 			"ts_ls",
		-- 			-- "vtsls",
		-- 		},
		-- 	})
		-- end,
	},
	{
		"neovim/nvim-lspconfig",
		-- event = "VeryLazy",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			if capabilities.textDocument then
				capabilities.textDocument.semanticTokens = nil
			end

			local on_attach = function(client, bufnr)
				-- Disable lsp semantic highlighting, because it was overriding treesitter and giving worse highlighting for ruby.
				-- In the future it might make sense to enable both but write the config to ensure that treesitter takes priority,
				-- but that only seems relevant if there's no treesitter parser for the language in question.
				if client.server_capabilities.semanticTokensProvider then
					client.server_capabilities.semanticTokensProvider = nil
				end

				local opts = { noremap = true, silent = true }
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				-- vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, opts)

				vim.keymap.set("n", "<leader>ih", function()
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
				end, { silent = true, noremap = true, desc = "Toggle [I]nlay [H]ints" })
			end

			local diagnostics = {
				underline = true,
				update_in_insert = true,
				virtual_text = {
					spacing = 4,
					source = "if_many",
					prefix = "●",
				},
				severity_sort = true,
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = " ",
						[vim.diagnostic.severity.WARN] = " ",
						[vim.diagnostic.severity.HINT] = " ",
						[vim.diagnostic.severity.INFO] = " ",
					},
				},
			}

			vim.diagnostic.config(vim.deepcopy(diagnostics))

			local function sorbet_root_pattern(...)
				local patterns = { "sorbet/config" }
				return require("lspconfig.util").root_pattern(unpack(patterns))(...)
			end

			-- Use new Neovim 0.11 native LSP configuration
			-- Configure servers using vim.lsp.config
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				on_attach = on_attach,
			})
			vim.lsp.config("ts_ls", {
				capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					typescript = {
						inlayHints = {
							includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all'
							includeInlayParameterNameHintsWhenArgumentMatchesName = true,
							includeInlayVariableTypeHints = true,
							includeInlayFunctionParameterTypeHints = true,
							includeInlayVariableTypeHintsWhenTypeMatchesName = true,
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
							includeInlayEnumMemberValueHints = true,
						},
					},
					javascript = {
						inlayHints = {
							includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all'
							includeInlayParameterNameHintsWhenArgumentMatchesName = true,
							includeInlayVariableTypeHints = true,
							includeInlayFunctionParameterTypeHints = true,
							includeInlayVariableTypeHintsWhenTypeMatchesName = true,
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
							includeInlayEnumMemberValueHints = true,
						},
					},
				},
			})
			vim.lsp.config("gopls", {
				capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					gopls = {
						hints = {
							assignVariableTypes = true,
							compositeLiteralFields = true,
							compositeLiteralTypes = true,
							constantValues = true,
							functionTypeParameters = true,
							parameterNames = true,
							rangeVariableTypes = true,
						},
					},
				},
			})
			-- lspconfig.solargraph.setup({
			-- 	capabilities = capabilities,
			-- 	on_attach = on_attach,
			-- })
			vim.lsp.config("rust_analyzer", {
				capabilities = capabilities,
				on_attach = on_attach,
			})
			vim.lsp.config("tailwindcss", {
				capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					tailwindCSS = {
						validate = true,
					},
				},
			})
			vim.lsp.config("eslint", {
				capabilities = capabilities,
				on_attach = on_attach,
			})
			vim.lsp.config("astro", {
				capabilities = capabilities,
				on_attach = on_attach,
			})
			vim.lsp.config("templ", {
				capabilities = capabilities,
				on_attach = on_attach,
			})
			vim.lsp.config("jsonls", {
				capabilities = capabilities,
				on_attach = on_attach,
			})
			vim.lsp.config("ruby_lsp", {
				capabilities = capabilities,
				on_attach = on_attach,
				init_options = {
					addonSettings = {
						["Ruby LSP Rails"] = {
							enablePendingMigrationsPrompt = false,
						},
					},
				},
			})
			vim.lsp.config("sorbet", {
				capabilities = capabilities,
				on_attach = on_attach,
				cmd = { "srb", "tc", "--lsp" },
				filetypes = { "ruby" },
				root_dir = function(fname)
					return sorbet_root_pattern(fname)
				end,
			})
			vim.lsp.config("emmet_ls", {
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = {
					"css",
					"elixir",
					"eruby",
					"heex",
					"html",
					"javascript",
					"javascriptreact",
					"less",
					"sass",
					"scss",
					"svelte",
					"pug",
					"typescriptreact",
					"vue",
				},
			})
			vim.lsp.config("herb_ls", {
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- Enable all configured LSP servers
			vim.lsp.enable({
				"lua_ls",
				"ts_ls",
				"gopls",
				"rust_analyzer",
				"tailwindcss",
				"eslint",
				"astro",
				"templ",
				"jsonls",
				"ruby_lsp",
				"sorbet",
				"emmet_ls",
				"herb_ls",
			})
		end,
	},
}

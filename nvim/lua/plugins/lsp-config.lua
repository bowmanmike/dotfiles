return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					-- "astro",
					-- "eslint",
					-- "gopls",
					-- "jsonls",
					-- "lua_ls",
					-- DO NOT USE MASON TO INSTALL RUBY_LSP, IT'S BROKEN
					-- https://shopify.github.io/ruby-lsp/editors.html#neovim
					-- "ruby_lsp",
					-- "rust_analyzer",
					-- "solargraph",
					-- "sorbet",
					-- "tailwindcss",
					-- "templ",
					-- "tsserver",
					-- "vtsls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

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

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig.tsserver.setup({
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
			lspconfig.gopls.setup({
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
			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					tailwindCSS = {
						validate = true,
					},
				},
			})
			lspconfig.eslint.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig.astro.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig.templ.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig.jsonls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig.ruby_lsp.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig.sorbet.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				cmd = { "srb", "tc", "--lsp" },
				filetypes = { "ruby" },
				root_dir = function(fname)
					return sorbet_root_pattern(fname)
				end,
			})
			lspconfig.emmet_ls.setup({
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
		end,
	},
}

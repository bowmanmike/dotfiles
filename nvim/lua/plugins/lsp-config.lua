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
					"lua_ls",
					"tsserver",
					"gopls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local on_attach = function()
				local opts = { noremap = true, silent = true }
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

				vim.keymap.set("n", "<leader>ih", function()
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
				end, { silent = true, noremap = true, desc = "Toggle [I]nlay [H]ints" })
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
		end,
	},
}

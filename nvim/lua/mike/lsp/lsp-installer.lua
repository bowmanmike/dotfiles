local lsp_installer = require("nvim-lsp-installer")
local handlers = require("mike.lsp.handlers")
local lspconfig = require("lspconfig")

lsp_installer.setup()

local default_opts = {
	on_attach = handlers.on_attach,
	capabilities = handlers.capabilities,
}

lspconfig.sumneko_lua.setup({
	on_attach = default_opts.on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

local nlsp_default_schemas = require("nlspsettings").get_default_schemas()
local schemastore_schemas = require("schemastore").json.schemas({
	select = {
		"package.json",
		".eslintrc",
		"tsconfig.json",
	},
})
local json_schemas = require("mike.utils").table_merge(nlsp_default_schemas, schemastore_schemas)

lspconfig.jsonls.setup({
	on_attach = default_opts.on_attach,
	settings = {
		json = {
			schemas = json_schemas,
		},
	},
})

lspconfig.tsserver.setup({
	on_attach = function(client, bufnr)
		client.server_capabilities.document_formatting = false
		default_opts.on_attach(client, bufnr)
	end,
})

lspconfig.solargraph.setup({
	on_attach = function(client, bufnr)
    -- client.server_capabilities.document_formatting = false
		client.server_capabilities.diagnostics = true
		default_opts.on_attach(client, bufnr)
	end,
})

lspconfig.stylelint_lsp.setup({
	on_attach = default_opts.on_attach,
})

lspconfig.tailwindcss.setup({
	init_options = {
		userLanguages = {
			elixir = "phoenix-heex",
			eruby = "erb",
			heex = "phoenix-heex",
			svelte = "html",
		},
	},
	handlers = {
		["tailwindcss/getConfiguration"] = function(_, _, params, _, bufnr, _)
			vim.lsp.buf_notify(bufnr, "tailwindcss/getConfigurationResponse", { _id = params._id })
		end,
	},
	settings = {
		includeLanguages = {
			typescript = "javascript",
			typescriptreact = "javascript",
			["html-eex"] = "html",
			["phoenix-heex"] = "html",
			heex = "html",
			eelixir = "html",
			elm = "html",
			erb = "html",
			svelte = "html",
		},
		tailwindCSS = {
			lint = {
				cssConflict = "warning",
				invalidApply = "error",
				invalidConfigPath = "error",
				invalidScreen = "error",
				invalidTailwindDirective = "error",
				invalidVariant = "error",
				recommendedVariantOrder = "warning",
			},
			experimental = {
				classRegex = {
					[[class= "([^"]*)]],
					[[class: "([^"]*)]],
					'~H""".*class="([^"]*)".*"""',
				},
			},
			validate = true,
		},
	},
	filetypes = {
		"css",
		"scss",
		"sass",
		"html",
		"heex",
		"elixir",
		"eruby",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"svelte",
	},
	on_attach = default_opts.on_attach,
})

lspconfig.cssls.setup({ on_attach = default_opts.on_attach })
lspconfig.elixirls.setup({ on_attach = default_opts.on_attach })
lspconfig.graphql.setup({ on_attach = default_opts.on_attach })
lspconfig.html.setup({ on_attach = default_opts.on_attach })
lspconfig.prismals.setup({ on_attach = default_opts.on_attach })
lspconfig.svelte.setup({ on_attach = default_opts.on_attach })
lspconfig.volar.setup({ on_attach = default_opts.on_attach })

local lsp_installer = require("nvim-lsp-installer")
-- require("nvim-lsp-installer").settings { log_level = vim.log.levels.DEBUG }

local custom_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true }

	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
end

local updated_capabilities = vim.lsp.protocol.make_client_capabilities()
updated_capabilities.textDocument.completion.completionItem.snippetSupport = true

lsp_installer.on_server_ready(function(server)
	local default_opts = {
		on_attach = custom_attach,
		capabilities = updated_capabilities,
	}

	-- JSON schemas
	local nlsp_default_schemas = require("nlspsettings.jsonls").get_default_schemas()
	local schemastore_schemas = require("schemastore").json.schemas({
		select = {
			"package.json",
			".eslintrc",
			"tsconfig.json",
		},
	})
	local json_schemas = require("mike.utils").table_merge(nlsp_default_schemas, schemastore_schemas)

	-- Set custom server config here
	local server_opts = {
		sumneko_lua = function()
			-- default_opts.cmd = { sumneko_binary, "-E", sumneko_root_path .. "/extension/server/main.lua" }

			default_opts.settings = { Lua = { diagnostics = { globals = { "vim" } } } }

			default_opts.on_attach = custom_attach
			default_opts.capabilities = updated_capabilities
		end,
		jsonls = function()
			default_opts.settings = {
				json = {
					schemas = json_schemas,
				},
			}
			default_opts.on_attach = custom_attach
			default_opts.capabilities = updated_capabilities
		end,
		eslint = function()
			default_opts.on_attach = function(client, bufnr)
				client.resolved_capabilities.document_formatting = true
				custom_attach(client, bufnr)
			end
			default_opts.settings = {
				format = { enable = true },
			}
		end,
		tsserver = function()
			default_opts.on_attach = function(client, bufnr)
				client.resolved_capabilities.document_formatting = false
				custom_attach(client, bufnr)
			end
		end,
		solargraph = function()
			default_opts.on_attach = function(client, bufnr)
				client.resolved_capabilities.document_formatting = true
				client.resolved_capabilities.diagnostics = true
				custom_attach(client, bufnr)
			end
		end,
		stylelint_lsp = function()
			default_opts.on_attach = function(client, bufnr)
				client.resolved_capabilities.document_formatting = false
				custom_attach(client, bufnr)
			end
		end,
	}

	server:setup((server_opts[server.name] and server_opts[server.name]()) or default_opts)
	vim.cmd([[ do User LspAttachBuffers ]])
end)

local lsp_installer = require("nvim-lsp-installer")
local handlers = require("mike.lsp.handlers")
-- require("nvim-lsp-installer").settings { log_level = vim.log.levels.DEBUG }

lsp_installer.on_server_ready(function(server)
	local default_opts = {
		on_attach = handlers.on_attach,
		capabilities = handlers.capabilities,
	}

	-- JSON schemas
	-- local nlsp_default_schemas = require("nlspsettings.jsonls").get_default_schemas()
  local nlsp_default_schemas = require("nlspsettings").get_default_schemas()
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

			default_opts.on_attach = handlers.on_attach
			default_opts.capabilities = handlers.capabilities
		end,
		jsonls = function()
			default_opts.settings = {
				json = {
					schemas = json_schemas,
				},
			}
			default_opts.on_attach = handlers.on_attach
			default_opts.capabilities = handlers.capabilities
		end,
		-- eslint = function()
		-- 	default_opts.on_attach = function(client, bufnr)
		-- 		client.resolved_capabilities.document_formatting = true
		-- 		handlers.on_attach(client, bufnr)
		-- 	end
		-- 	default_opts.settings = {
		-- 		format = { enable = false },
		-- 	}
		-- end,
		tsserver = function()
			default_opts.on_attach = function(client, bufnr)
				client.resolved_capabilities.document_formatting = false
				handlers.on_attach(client, bufnr)
			end
		end,
		solargraph = function()
			default_opts.on_attach = function(client, bufnr)
				client.resolved_capabilities.document_formatting = false
				client.resolved_capabilities.diagnostics = true
				-- client.diagnostics = false
				handlers.on_attach(client, bufnr)
        -- default_opts.settings.solargraph.diagnostics = false
			end
      -- print("HERE")
			-- default_opts.settings.diagnostics = false
		end,
		stylelint_lsp = function()
			default_opts.on_attach = function(client, bufnr)
				client.resolved_capabilities.document_formatting = false
				handlers.on_attach(client, bufnr)
			end
		end,
	}

	server:setup((server_opts[server.name] and server_opts[server.name]()) or default_opts)
	vim.cmd([[ do User LspAttachBuffers ]])
end)

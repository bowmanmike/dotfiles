local lsp_installer = require("nvim-lsp-installer")
-- require("nvim-lsp-installer").settings { log_level = vim.log.levels.DEBUG }

local system_name
if vim.fn.has("mac") == 1 then
	system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
	system_name = "Linux"
elseif vim.fn.has("win32") == 1 then
	system_name = "Windows"
else
	print("Unsupported system for sumneko")
end

local sumneko_root_path = vim.fn.stdpath("data") .. "/lsp_servers/sumneko_lua"
local sumneko_binary = sumneko_root_path .. "/extension/server/bin/" .. system_name .. "/lua-language-server"

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
	local json_schemas = require("utils").table_merge(nlsp_default_schemas, schemastore_schemas)

	-- Set custom server config here
	local server_opts = {
		sumneko_lua = function()
			default_opts.cmd = { sumneko_binary, "-E", sumneko_root_path .. "/extension/server/main.lua" }

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

require("lspconfig")["null-ls"].setup({
	on_attach = custom_attach,
	capabilities = updated_capabilities,
})

vim.diagnostic.config({
	virtual_text = false,
})
vim.cmd([[
  autocmd CursorHold * lua vim.diagnostic.open_float()
]])
vim.o.updatetime = 300
-- Show all diagnostics on current line in floating window
vim.api.nvim_set_keymap("n", "<Leader>d", ":lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
-- Go to next diagnostic (if there are multiple on the same line, only shows
-- one at a time in the floating window)
vim.api.nvim_set_keymap("n", "<Leader>nd", ":lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true })
-- Go to prev diagnostic (if there are multiple on the same line, only shows
-- one at a time in the floating window)
vim.api.nvim_set_keymap("n", "<Leader>pd", ":lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })

require("nlspsettings").setup()

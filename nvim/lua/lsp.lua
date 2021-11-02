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
					schemas = require("nlspsettings.jsonls").get_default_schemas(),
				},
			}
			default_opts.on_attach = custom_attach
			default_opts.capabilities = updated_capabilities
		end,
		-- cssls = function()
		-- 	default_opts.filetypes = { "css", "scss", "javascript" }
		-- end,
	}

	-- local result = (server_opts[server.name] and server_opts[server.name]()) or default_opts
	-- print(require('utils').dump(result))
	server:setup((server_opts[server.name] and server_opts[server.name]()) or default_opts)
	vim.cmd([[ do User LspAttachBuffers ]])
end)

local null_ls = require("null-ls")

local prettierd_filetypes = { unpack(null_ls.builtins.formatting.prettierd.filetypes) }
table.insert(prettierd_filetypes, "graphql")
table.insert(prettierd_filetypes, "jsonc")

local null_ls_sources = {
	-- null_ls.builtins.diagnostics.eslint_d,
	null_ls.builtins.diagnostics.luacheck,
	null_ls.builtins.diagnostics.markdownlint,
	null_ls.builtins.diagnostics.shellcheck,
	null_ls.builtins.diagnostics.stylelint,
	null_ls.builtins.formatting.eslint_d,
	-- null_ls.builtins.formatting.prettierd.with({
	-- 	filetypes = prettierd_filetypes,
	-- }),
	null_ls.builtins.formatting.shfmt,
	null_ls.builtins.formatting.stylua,
}

null_ls.config({
	sources = null_ls_sources,
})

require("lspconfig")["null-ls"].setup({
	on_attach = custom_attach,
	capabilities = updated_capabilities,
})

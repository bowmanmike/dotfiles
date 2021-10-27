local lsp_config = require("lspconfig")

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
end

local servers = {
	bashls = true,
	cssls = true,
	denols = true,
	dockerls = true,
	elixirls = true,
	emmet_ls = true,
	eslint = true,
	gopls = true,
	graphql = true,
	html = true,
	jsonls = true,
	rust_analyzer = true,
	solargraph = true,
	stylelint_lsp = true,
	sumneko_lua = {
		cmd = { sumneko_binary, "-E", sumneko_root_path .. "/extension/server/main.lua" },
		settings = { Lua = { diagnostics = { globals = { "vim" } } } },
	},
	svelte = true,
	tailwindcss = true,
	tsserver = true,
	vimls = true,
	volar = true,
	vuels = true,
	yamlls = true,
}

local function setup_server(server, config)
	if not config then
		return
	end

	if type(config) ~= "table" then
		config = {}
	end

	config = vim.tbl_deep_extend("force", {
		on_attach = custom_attach,
		-- capabilities = updated_capabilities,
		flags = {
			debounce_text_changes = 50,
		},
	}, config)

	lsp_config[server].setup(config)
end

for server, cfg in pairs(servers) do
  setup_server(server, cfg)
end

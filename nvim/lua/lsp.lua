local lsp_config = require("lspconfig")

local servers = {
	"bashls",
	"cssls",
	"denols",
	"dockerls",
	"elixirls",
	"emmet_ls",
	"eslint",
	"gopls",
	"graphql",
	"html",
	"jsonls",
	"rust_analyzer",
	"solargraph",
	"stylelint_lsp",
	-- "sumneko_lua",
	"svelte",
	"tailwindcss",
	"tsserver",
	"vimls",
	"volar",
	"vuels",
	"yamlls",
}

local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
end

for _, server in ipairs(servers) do
  lsp_config[server].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150
    }
  }
end

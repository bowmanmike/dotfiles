local lsp_config = require("lspconfig")
require("mason").setup()
require("mason-lspconfig").setup()
local on_attach = require("mike.lsp_handlers").on_attach

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>ge', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>gq', vim.diagnostic.setloclist, opts)


local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

lsp_config["sumneko_lua"].setup({
  on_attach = on_attach,
  flags = lsp_flags,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      }
    }
  }
})
lsp_config["tsserver"].setup({
  on_attach = on_attach,
  flags = lsp_flags,
})
lsp_config["elixirls"].setup({
  on_attach = on_attach,
  flags = lsp_flags
})

lsp_config["solargraph"].setup({
  on_attach = on_attach,
  flags = lsp_flags
})

-- require('lspconfig')['pyright'].setup{
--     on_attach = on_attach,
--     flags = lsp_flags,
-- }
-- require('lspconfig')['tsserver'].setup{
--     on_attach = on_attach,
--     flags = lsp_flags,
-- }
-- require('lspconfig')['rust_analyzer'].setup{
--     on_attach = on_attach,
--     flags = lsp_flags,
--     -- Server-specific settings...
--     settings = {
--       ["rust-analyzer"] = {}
--     }
-- }

local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.ensure_installed({
  "tsserver",
  "eslint",
  "sumneko_lua",
  "solargraph",
  "tailwindcss",
  "rust_analyzer"
})

lsp.setup()

-- NOTE: Disabled while I try lsp-zero

-- local lsp_config = require("lspconfig")
-- require("mason").setup()
-- require("mason-lspconfig").setup()
-- local on_attach = require("mike.lsp_handlers").on_attach
-- local capabilities = require("mike.lsp_handlers").capabilities

-- -- Mappings.
-- -- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- local opts = { noremap = true, silent = true }
-- vim.keymap.set('n', '<leader>ge', vim.diagnostic.open_float, opts)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
-- vim.keymap.set('n', '<leader>gq', vim.diagnostic.setloclist, opts)


-- local lsp_flags = {
--   -- This is the default in Nvim 0.7+
--   debounce_text_changes = 150,
-- }

-- lsp_config["sumneko_lua"].setup({
--   on_attach = on_attach,
--   flags = lsp_flags,
--   capabilities = capabilities,
--   settings = {
--     Lua = {
--       diagnostics = {
--         globals = { "vim" }
--       }
--     }
--   }
-- })
-- lsp_config["tsserver"].setup({
--   on_attach = on_attach,
--   flags = lsp_flags,
--   capabilities = capabilities,
-- })
-- -- NOTE: Handled specifically by the elixir.nvim plugin
-- -- lsp_config["elixirls"].setup({
-- --   on_attach = on_attach,
-- --   flags = lsp_flags
-- -- })

-- lsp_config["solargraph"].setup({
--   on_attach = on_attach,
--   flags = lsp_flags,
--   capabilities = capabilities,
-- })

-- lsp_config["tailwindcss"].setup({
--   on_attach = on_attach,
--   flags = lsp_flags,
--   capabilities = capabilities,
--   init_options = {
--     userLanguages = {
--       eelixir = "html-eex",
--       eruby = "erb",
--       heex = "phoenix-heex",
--       svelte = "html"
--     }
--   },
--   setings = {
--     tailwindCSS = {
--       classAttributes = { "class", "className", "classList", "ngClass" },
--       lint = {
--         cssConflict = "warning",
--         invalidApply = "error",
--         invalidConfigPath = "error",
--         invalidScreen = "error",
--         invalidTailwindDirective = "error",
--         invalidVariant = "error",
--         recommendedVariantOrder = "warning"
--       },
--       validate = true
--     }
--   }
-- })

-- lsp_config["gopls"].setup({
--   on_attach = on_attach,
--   flags = lsp_flags,
--   capabilities = capabilities
-- })

-- -- require('lspconfig')['pyright'].setup{
-- --     on_attach = on_attach,
-- --     flags = lsp_flags,
-- -- }
-- -- require('lspconfig')['tsserver'].setup{
-- --     on_attach = on_attach,
-- --     flags = lsp_flags,
-- -- }
-- lsp_config['rust_analyzer'].setup {
--   on_attach = on_attach,
--   flags = lsp_flags,
--   capabilities = capabilities
--   -- Server-specific settings...
--   -- settings = {
--   --   ["rust-analyzer"] = {}
--   -- }
-- }

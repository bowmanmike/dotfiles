local null_ls = require("null-ls")
local on_attach = require("mike.lsp_handlers").on_attach

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  -- debug = true,
  on_attach = on_attach,
  sources = {
    diagnostics.credo,
    diagnostics.eslint_d,
    diagnostics.jsonlint,
    diagnostics.luacheck,
    diagnostics.markdownlint,
    diagnostics.standardrb,
    diagnostics.yamllint,

    formatting.jq,
    formatting.markdownlint,
    formatting.prettierd,
    formatting.yamlfmt,
  }
})

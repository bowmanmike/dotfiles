local elixir = require("elixir")
local on_attach = require("mike.lsp_handlers").on_attach
local capabilities = require("mike.lsp_handlers").capabilities

elixir.setup({
  cmd = "/Users/mikebowman/.local/share/nvim/mason/bin/elixir-ls",

  settings = elixir.settings({
    dialyzerEnabled = true,
    fetchDeps = false,
    enableTestLenses = false,
    suggestSpecs = false
  }),

  on_attach = function(client, bufnr)
    local map_opts = { buffer = true, noremap = true }
    -- remove the pipe operator
    vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", map_opts)
    -- add the pipe operator
    vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", map_opts)
    vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", map_opts)

    on_attach(client, bufnr)
  end,
  capabilities = capabilities
})

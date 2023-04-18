local elixir = require("elixir")
local on_attach = require("mike.lsp_handlers").on_attach
local capabilities = require("mike.lsp_handlers").capabilities
local nnoremap = require("mike.keymap").nnoremap

local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node

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

nnoremap("<leader>pr", "orequire IEx; IEx.pry()<esc>")
nnoremap("<leader>in", "oIO.inspect()<esc>i")

local fn = function(args)
  return args[1][1]
end
ls.add_snippets("elixir", {
  s({ trig = "k" }, {
    i(1),
    t(": "),
    f(function(args)
      return args[1][1]
    end, { 1 }),
    t(",")
    -- f(function(args)
    --   print(args[0])
    --   i(args[0])
    -- end, {1})
  })
})

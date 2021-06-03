-- LSP object
local nvim_lsp = require('lspconfig')

-- function to attach completion and diagnostics
-- when setting up lsp
-- local illuminate_enabled = { rust_analyzer=true, gopls=true, solargraph=true }

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true


local on_attach = function(client)
  -- require'completion'.on_attach(client)
  -- require'illuminate'.on_attach(client)

  -- client_name = client[name]
  -- if illuminate_enabled[client_name] then
  --   require'illuminate'.on_attach(client)

  --   vim.api.nvim_command [[ hi def link LspReferenceText CursorLine ]]
  -- end
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- This will disable virtual text, like doing:
    -- let g:diagnostic_enable_virtual_text = 0
    -- virtual_text = false,

    -- This is similar to:
    -- let g:diagnostic_show_sign = 1
    -- To configure sign display,
    --  see: ":help vim.lsp.diagnostic.set_signs()"
    signs = true,

    -- This is similar to:
    -- "let g:diagnostic_insert_delay = 1"
    update_in_insert = false,
  }
)

local sumneko_root_path = '/Users/mikebowman/coding/lua/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/macOS/lua-language-server"

-- Enable lang servers
nvim_lsp.cssls.setup({ on_attach = on_attach })
nvim_lsp.dockerls.setup({ on_attach = on_attach })
nvim_lsp.elixirls.setup({ on_attach = on_attach, settings={ fetchDeps=false, dialyzerFormat='dialyxir_short' }, cmd={'/Users/mikebowman/coding/elixir/elixir-ls/release/language_server.sh'} })
nvim_lsp.html.setup({ capabilities = capabilities })
nvim_lsp.gopls.setup({ on_attach = on_attach })
-- nvim_lsp.jedi_language_server.setup({ on_attach=on_attach }) -- python
nvim_lsp.jsonls.setup({ on_attach = on_attach })
nvim_lsp.pyls.setup({ on_attach = on_attach })
nvim_lsp.rust_analyzer.setup({ on_attach = on_attach, cmd={'/Users/mbowman/.local/bin/rust-analyzer'} })
nvim_lsp.solargraph.setup({ on_attach = on_attach, cmd={'solargraph', 'stdio'} })
nvim_lsp.sumneko_lua.setup({ on_attach = on_attach, cmd={sumneko_binary, '-E', sumneko_root_path .. '/main.lua'}, settings = {
  Lua = {
    diagnostics = {
      globals = { 'vim' }
    }
  }
} })
nvim_lsp.tsserver.setup({ on_attach = on_attach })
nvim_lsp.yamlls.setup({ on_attach = on_attach })

-- vim.lsp.set_log_level("debug")

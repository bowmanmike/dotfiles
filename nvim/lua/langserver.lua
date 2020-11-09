-- LSP object
local nvim_lsp = require('nvim_lsp')

-- function to attach completion and diagnostics
-- when setting up lsp
local on_attach = function(client)
    require'completion'.on_attach(client)
    require'diagnostic'.on_attach(client)
end

-- Enable lang servers
nvim_lsp.cssls.setup({ on_attach=on_attach })
nvim_lsp.dockerls.setup({ on_attach=on_attach })
nvim_lsp.elixirls.setup({ on_attach=on_attach, settings={ fetchDeps=false, dialyzerFormat='dialyxir_short' } })
nvim_lsp.html.setup({ on_attach=on_attach })
nvim_lsp.gopls.setup({ on_attach=on_attach })
-- nvim_lsp.jedi_language_server.setup({ on_attach=on_attach }) -- python
nvim_lsp.jsonls.setup({ on_attach=on_attach })
nvim_lsp.pyls.setup({ on_attach=on_attach })
nvim_lsp.rust_analyzer.setup({ on_attach=on_attach, cmd={'/usr/local/bin/rust-analyzer'} })
nvim_lsp.solargraph.setup({ on_attach=on_attach, cmd={'solargraph', 'stdio'} })
nvim_lsp.sumneko_lua.setup({ on_attach=on_attach })
nvim_lsp.tsserver.setup({ on_attach=on_attach })
nvim_lsp.yamlls.setup({ on_attach=on_attach })

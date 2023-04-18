local api = vim.api
local handlers = require("mike.lsp_handlers") -- can I pull these handlers out of lsp-zero?
local metals_config = require("metals").bare_config()
local lsp = require("lsp-zero")

metals_config.capabilities = handlers.capabilities

-- metals_config.on_attach = function(client, bufnr)
--   local mappings = lsp.defaults.cmp_mappings()
--   print(vim.inspect(mappings))
--   for k, v in pairs(mappings) do

--     -- print(vim.inspect(k))
--     -- print()
--   end
-- end
metals_config.on_attach = handlers.on_attach

local nvim_metals_group = api.nvim_create_augroup("nvim-metals", {clear = true})
api.nvim_create_autocmd("FileType", {
  pattern = { "scala", "sbt", "java" },
  callback = function()
    require("metals").initialize_or_attach(metals_config)
  end,
  group = nvim_metals_group
})

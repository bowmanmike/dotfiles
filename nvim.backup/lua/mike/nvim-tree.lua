-- local tree = require("nvim-tree")
require("nvim-tree").setup()

vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>n", ":NvimTreeFindFile<cr>", { noremap = true, silent = true })

-- tree.setup({
--   renderer = {
--     icons = {
--       git_placement = "signcolumn",
--       show = {
--         file = true,
--         folder = false,
--         folder_arrow = false,
--         git = true,
--       },
--     },
--   }
-- })

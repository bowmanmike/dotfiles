local telescope = require("telescope")
telescope.setup({})
telescope.load_extension("fzf")

vim.api.nvim_set_keymap("n", "<C-P>", ":Telescope find_files<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-B>", ":Telescope buffers<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-T>", ":Telescope live_grep<cr>", { noremap = true, silent = true })

-- Colorscheme with preview
-- <cmd>lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<cr>

vim.cmd([[ let test#strategy = 'neovim' ]])

vim.api.nvim_set_keymap("n", "<leader>tn", ":TestNearest<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tf", ":TestFile<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tl", ":TestLast<cr>", { noremap = true, silent = true })

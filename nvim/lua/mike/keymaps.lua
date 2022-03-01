vim.cmd([[
command! Q q
command! W w
command! Wq wq
command! WQ wq
command! Qw wq
command! QW wq
command! SO luafile $MYVIMRC
command! SF luafile %
]])

-- Remap space as leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Remap for dealing with word wrap
vim.api.nvim_set_keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- Terminal Mode Stuff
vim.api.nvim_set_keymap("t", "<C-o>", "<C-\\><C-n>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>th", ":split term://zsh<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tv", ":vsplit term://zsh<cr>", { noremap = true })

-- vim.api.nvim_set_keymap("n", "<C-\\>", ":ToggleTerm<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("t", "<C-\\>", "<C-o>:ToggleTerm<CR>", { noremap = true, silent = true })

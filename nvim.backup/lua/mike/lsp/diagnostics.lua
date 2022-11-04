vim.diagnostic.config({
	virtual_text = false,
})

vim.cmd([[
  autocmd CursorHold * lua vim.diagnostic.open_float()
]])

vim.o.updatetime = 300
-- Show all diagnostics on current line in floating window
vim.api.nvim_set_keymap("n", "<Leader>d", ":lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
-- Go to next diagnostic (if there are multiple on the same line, only shows
-- one at a time in the floating window)
vim.api.nvim_set_keymap("n", "<Leader>nd", ":lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true })
-- Go to prev diagnostic (if there are multiple on the same line, only shows
-- one at a time in the floating window)
vim.api.nvim_set_keymap("n", "<Leader>pd", ":lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })

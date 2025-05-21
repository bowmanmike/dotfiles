vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.expandtab = true
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "ruby",
	callback = function()
		vim.keymap.set("n", "<leader>pr", "obinding.pry<esc>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>br", "obinding.break<esc>", { noremap = true, silent = true })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "elixir",
	callback = function()
		vim.keymap.set("n", "<leader>pr", "orequire IEx; IEx.pry()<esc>", { noremap = true, silent = true })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "codecompanion",
	callback = function()
		vim.opt_local.number = false
	end,
})

-- create autocommand to set .rabl files to use filetype=ruby
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.rabl",
	callback = function()
		vim.bo.filetype = "ruby"
	end,
})

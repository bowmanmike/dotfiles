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
		vim.keymap.set("n", "<leader>pr", "obinding.break<esc>", { noremap = true, silent = true })
	end,
})

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local packer_bootstrap

if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

require("packer").startup(function(use)
	use({
		"phaazon/hop.nvim",
		branch = "v1.3",
		config = function()
			require("hop").setup()
		end,
	})
end)

-- vim.g.mapleader = " "
-- vim.g.maplocalleader = " "

vim.api.nvim_set_keymap("n", "S", ":HopChar2<cr>", { silent = true })
vim.api.nvim_set_keymap("n", "s", ":HopWord<cr>", { silent = true })
-- vim.api.nvim_set_keymap("n", "<leader>pr", "orequire 'pry-byebug'; binding.pry<esc>", { silent = true })

vim.o.termguicolors = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.clipboard = "unnamed"

vim.api.nvim_exec(
	[[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank({ timeout = 250 })
  augroup end
]],
	false
)

print("loaded")

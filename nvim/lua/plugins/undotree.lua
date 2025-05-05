return {
	"mbbill/undotree",
	lazy = false,
	config = function()
		vim.opt.undofile = true
		vim.opt.undolevels = 1000
		vim.opt.undoreload = 10000
	end,
}

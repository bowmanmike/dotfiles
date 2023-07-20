vim.o.backup = false
vim.o.breakindent = true
vim.o.clipboard = "unnamedplus"
vim.o.completeopt = "menuone,noselect"
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevel = 100
vim.o.foldmethod = "expr"
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.inccommand = "nosplit"
vim.o.listchars = "tab:»·,trail:·,nbsp:·"
vim.o.relativenumber = false
vim.o.scrolloff = 5
vim.o.shiftround = true
vim.o.shiftwidth = 2
vim.o.showcmd = false
vim.o.smartcase = true
vim.o.smarttab = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.swapfile = false
vim.o.swapfile = false
vim.o.tabstop = 2
vim.o.termguicolors = true
vim.o.timeoutlen = 300
vim.o.updatetime = 250
vim.wo.number = true
vim.wo.signcolumn = "yes"

-- Save undo history
vim.cmd([[
" Let's save undo info!
if !isdirectory($HOME."/nobackup/nvim-undodir")
call mkdir($HOME."/nobackup/nvim-undodir", "", 0770)
endif
set undodir=~/nobackup/nvim-undodir
set undofile
]])

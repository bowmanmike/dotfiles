local fn = vim.fn

vim.o.backup = false
vim.o.clipboard = "unnamed"
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.inccommand = "nosplit"
vim.o.lazyredraw = true
vim.o.listchars = "tab:»·,trail:·,nbsp:·"
vim.o.mouse = "a"
vim.o.number = true
vim.o.scrolloff = 5
vim.o.shiftround = true
vim.o.shiftwidth = 2
vim.o.showcmd = false
vim.wo.signcolumn = "yes"
vim.o.smartcase = true
vim.o.smarttab = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.swapfile = false
vim.o.tabstop = 2
vim.o.termguicolors = true

-- Strip trailing whitespace
vim.cmd([[
au BufWritePre *.rb :%s/\s\+$//e
au BufWritePre *.go :%s/\s\+$//e
au BufWritePre *.js :%s/\s\+$//e
au BufWritePre *.html :%s/\s\+$//e
au BufWritePre *.css :%s/\s\+$//e
au BufWritePre *.scss :%s/\s\+$//e
au BufWritePre *.yaml :%s/\s\+$//e
au BufWritePre *.ex :%s/\s\+$//e
au BufWritePre *.exs :%s/\s\+$//e
au BufWritePre *.json :%s/\s\+$//e
au BufWritePre *.py :%s/\s\+$//e
au BufWritePre *.vim :%s/\s\+$//e
au BufWritePre *.lua :%s/\s\+$//e
au BufWritePre *.scala :%s/\s\+$//e
]])

-- File Reloading
vim.cmd([[
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
]])

-- Highlight on yank
vim.api.nvim_exec(
	[[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
	false
)

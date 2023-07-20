local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

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
vim.o.smartcase = true
vim.o.smarttab = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.swapfile = false
vim.o.tabstop = 2
vim.o.termguicolors = true
vim.wo.signcolumn = "yes"

vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"

-- vim.cmd([[autocmd BufReadPost,FileReadPost * normal zR]])
vim.o.foldlevelstart = 99999

-- Use global statusline
vim.o.laststatus = 3

-- Hide window separator

vim.cmd([[autocmd ColorScheme * highlight WinSeparator guibg=NONE]])

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

vim.cmd([[
if !isdirectory($HOME."/nobackup/nvim-undodir")
  call mkdir($HOME."/nobackup/nvim-undodir", "", 0770)
  endif
  set undodir=~/nobackup/nvim-undodir
  set undofile
]])


  require("lazy").setup({
    "tpope/vim-fugitive",
    "tpope/vim-surround",
    "tpope/vim-commentary",
    {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      opts = {} -- this is equalent to setup({}) function,
    },
    "rebelot/kanagawa.nvim",
    "folke/tokyonight.nvim",
    {
      "junegunn/fzf.vim",
      dependencies = {
        "junegunn/fzf"
      }
    },
    { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
  })


  require("lazy").setup(plugins, opts)

  vim.cmd("colorscheme kanagawa")

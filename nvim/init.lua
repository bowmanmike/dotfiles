local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
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
	use("wbthomason/packer.nvim")

	use("neovim/nvim-lspconfig")
	use("tamago324/nlsp-settings.nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	use("antoinemadec/FixCursorHold.nvim")
	use("williamboman/nvim-lsp-installer")
	use({ "nvim-telescope/telescope.nvim", requires = {
		"nvim-lua/plenary.nvim",
		"nvim-lua/popup.nvim",
	} })
	use({ "nvim-telescope/telescope-fzf-native.nvim", requires = { "nvim-telescope/telescope.nvim" } })
	use({
		"junegunn/fzf.vim",
		requires = {
			"junegunn/fzf",
			run = function()
				vim.fn["fzf#install"]()
			end,
		},
	})

	use("nanotech/jellybeans.vim")
	use("morhetz/gruvbox")
	use("skbolton/embark")
	use("bluz71/vim-nightfly-guicolors")
	use("bluz71/vim-moonfly-colors")
	use("christianchiarulli/nvcode-color-schemes.vim")
	use("dracula/vim")
	use("folke/tokyonight.nvim")

	use("tpope/vim-commentary")
	use("tpope/vim-repeat")
	use("tpope/vim-surround")
	use("tpope/vim-rhubarb")
	use("tpope/vim-dispatch")
	use("tpope/vim-fugitive")
	use("jiangmiao/auto-pairs")
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { hl = "GitGutterAdd" },
					change = { hl = "GitGutterChange" },
					delete = { hl = "GitGutterDelete" },
					topdelete = { hl = "GitGutterDelete" },
					changedelete = { hl = "GitGutterChange" },
				},
			})
		end,
	})
	use("kyazdani42/nvim-web-devicons")
	use("akinsho/nvim-toggleterm.lua")
	use("lukas-reineke/indent-blankline.nvim")

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = "maintained",
				disable = { "haskell" },
				context_commentstring = { enable = true },
				highlight = { enable = true },
				rainbow = { enable = true },
			})
		end,
	})
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("nvim-treesitter/playground")
	use({ "p00f/nvim-ts-rainbow" })
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
		},
	})
	use("onsails/lspkind-nvim")

	if packer_bootstrap then
		require("packer").sync()
	end
end)

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

vim.cmd([[ colorscheme moonfly ]])

-- File Reloading
vim.cmd([[
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
]])

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

vim.cmd([[
command! Q q
command! W w
command! Wq wq
command! WQ wq
command! Qw wq
command! QW wq
command! SO luafile $MYVIMRC
]])

--Remap space as leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Remap for dealing with word wrap
vim.api.nvim_set_keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

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

-- Y yank until the end of line  (note: this is now a default on master)
vim.api.nvim_set_keymap("n", "Y", "y$", { noremap = true })

-- -- vim.cmd('let mapleader = \"<space>\"')
-- -- vim.cmd('colorscheme embark')
-- -- vim.cmd('colorscheme moonfly')
-- -- vim.cmd('let g:nvcode_termcolors=256')
-- -- vim.cmd('hi LineNr ctermbg=NONE guibg=NONE')
-- core_options()
vim.api.nvim_set_keymap("n", "<C-P>", ":Telescope find_files<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-B>", ":Telescope buffers<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-T>", ":Telescope live_grep<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>gs", ":Git<cr>", { noremap = true })

vim.opt.completeopt = { "menu", "menuone", "noselect" }
require("cmp").setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	sources = {
		{ name = "nvim_lua" },
		{ name = "zsh" },
		{ name = "nvim_lsp" },
		{ name = "path" },
		{ name = "luasnip" },
		{ name = "buffer", keyword_length = 5 },
	},
	formatting = {
		-- Youtube: How to set up nice formatting for your sources.
		format = require("lspkind").cmp_format({
			with_text = true,
			menu = {
				buffer = "[buf]",
				nvim_lsp = "[LSP]",
				nvim_lua = "[api]",
				path = "[path]",
				luasnip = "[snip]",
				gh_issues = "[issues]",
			},
		}),
	},
	experimental = {
		native_menu = false,
		ghost_text = true,
	},
})

-- Map blankline
vim.g.indent_blankline_char = "┊"
vim.g.indent_blankline_filetype_exclude = { "help", "packer" }
vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
vim.g.indent_blankline_char_highlight = "LineNr"
vim.g.indent_blankline_show_trailing_blankline_indent = false

-- NOTE: Maybe I want to be able to navigate the Telescope prompt in normal mode
-- local actions = require("telescope.actions")
-- require("telescope").setup({
-- 	defaults = {
-- 		mappings = {
-- 			i = {
-- 				["<esc>"] = actions.close,
-- 			},
-- 		},
-- 	},
-- })

require("base")

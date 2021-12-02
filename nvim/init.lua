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
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make", requires = { "nvim-telescope/telescope.nvim" } })
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
	use("vim-ruby/vim-ruby")
	use("tpope/vim-rails")
	use("pangloss/vim-javascript")
	use("elixir-editors/vim-elixir")
	use("mattn/emmet-vim")
	use({ "jparise/vim-graphql", ft = "graphql" })
	use({ "fatih/vim-go", ft = "go" })
	use("cespare/vim-toml")
	use("hashivim/vim-hashicorp-tools")

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
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({ "*" }, {
				RGB = true, -- #RGB hex codes
				RRGGBB = true, -- #RRGGBB hex codes
				RRGGBBAA = true, -- #RRGGBBAA hex codes
				rgb_fn = true, -- CSS rgb() and rgba() functions
				hsl_fn = true, -- CSS hsl() and hsla() functions
				css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
				css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
			})
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		opt = false,
		run = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = "maintained",
				disable = { "haskell" },
				context_commentstring = { enable = true },
				highlight = { enable = true },
				rainbow = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<leader>is",
						scope_incremental = "<leader>is",
						node_incremental = "<TAB>",
						node_decremental = "<S-TAB>",
					},
				},
			})
		end,
	})
	use({
		"JoosepAlviste/nvim-ts-context-commentstring",
		event = "BufRead",
		config = {
			javascript = {
				__default = "// %s",
				jsx_element = "{/* %s */}",
				jsx_fragment = "{/* %s */}",
				jsx_attribute = "// %s",
				comment = "// %s",
			},
		},
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
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("nvim-tree").setup({})
		end,
	})
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
			})
		end,
	})
	use("kdheepak/lazygit.nvim")
	use("b0o/schemastore.nvim")
	use("vim-test/vim-test")

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
command! SF luafile %
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

local telescope = require("telescope")
telescope.setup({})
telescope.load_extension("fzf")

vim.api.nvim_set_keymap("n", "<C-P>", ":Telescope find_files<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-B>", ":Telescope buffers<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-T>", ":Telescope live_grep<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>gs", ":Git<cr>", { noremap = true })

vim.opt.completeopt = { "menu", "menuone", "noselect" }
local cmp = require("cmp")
cmp.setup({
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
	mapping = {
		["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
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
--
vim.api.nvim_set_keymap("t", "<C-o>", "<C-\\><C-n>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>th", ":split term://zsh<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tv", ":vsplit term://zsh<cr>", { noremap = true })

vim.g.user_emmet_leader_key = "<C-Z>"

vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>n", ":NvimTreeFindFile<cr>", { noremap = true, silent = true })
-- TODO: Write a lua function to duplicate a file with a new path

vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>LazyGit<cr>", { noremap = true, silent = true })

vim.cmd([[ let test#strategy = 'neovim' ]])
vim.api.nvim_set_keymap("n", "<leader>tn", ":TestNearest<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tf", ":TestFile<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tl", ":TestLast<cr>", { noremap = true, silent = true })

vim.cmd([[
  autocmd FileType elixir nmap <leader>pr orequire IEx; IEx.pry()<esc>
  autocmd FileType elixir nnoremap <leader>in oIO.inspect()<esc>i
  ]])

require("base")

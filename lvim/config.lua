--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = false
lvim.colorscheme = "moonfly"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["Y"] = "y$"
lvim.keys.normal_mode["<leader>tn"] = ":TestNearest<cr>"
lvim.keys.normal_mode["<leader>tf"] = ":TestFile<cr>"
lvim.keys.normal_mode["<leader>ts"] = ":TestSuite<cr>"
-- lvim.keys.normal_mode["<leader>gs"] = ":Git<cr>"
lvim.keys.normal_mode["<leader>gd"] = ":Gitdiffsplit<cr>"
lvim.keys.normal_mode["<leader>gb"] = ":Git blame<cr>"
lvim.keys.normal_mode["<leader>gp"] = ":Git push<cr>"
lvim.keys.normal_mode["<leader>z"] = ":tabnew %<cr>"
lvim.keys.normal_mode["<C-b>"] = ":Buffers<cr>"

lvim.keys.visual_mode["<leader>P"] = '"_dP'

lvim.keys.term_mode["<C-o>"] = "<C-\\><C-n>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- lvim.builtin.telescope.on_config_done = function()
--   local actions = require "telescope.actions"
--   -- for input mode
--   lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
--   lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
--   lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
--   lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.cycle_history_prev
--   -- for normal mode
--   lvim.builtin.telescope.defaults.mappings.n["<C-j>"] = actions.move_selection_next
--   lvim.builtin.telescope.defaults.mappings.n["<C-k>"] = actions.move_selection_previous
-- end

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["g"]["t"] = { "<cmd>Git<cr>", "Git Status" }
lvim.builtin.which_key.mappings["/"] = nil
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.comment.active = false
lvim.builtin.lualine.options.theme = "moonfly"
lvim.builtin.autopairs.active = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.playground.enable = true
lvim.builtin.treesitter.context_commentstring = {
	enable = true,
	config = {
		javascript = {
			__default = "// %s",
			jsx_element = "{/* %s */}",
			jsx_fragment = "{/* %s */}",
			jsx_attribute = "// %s",
			comment = "// %s",
		},
	},
}
lvim.builtin.treesitter.rainbow = {
	enable = true,
}

-- lvim.builtin.lualine.sections.lualine_b = { "filename", file_status = true, path = 1 }
-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
-- lvim.lsp.null_ls.setup = {
--   root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules"),
-- }
-- or if you need something more advanced
-- lvim.lsp.null_ls.setup.root_dir = function(fname)
--   if vim.bo.filetype == "javascript" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
--       or require("lspconfig/util").path.dirname(fname)
--   elseif vim.bo.filetype == "php" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
--   else
--     return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
--   end
-- end
lvim.lsp.diagnostics.virtual_text = false
lvim.builtin.lspinstall.on_config_done = function()
	lvim.lang.tailwindcss.lsp.setup.filetypes = { "javascript", "javascriptreact" }
	lvim.lang.tailwindcss.lsp.active = true
	require("lsp").setup("tailwindcss")
end

-- set a formatter if you want to override the default lsp one (if it exists)
lvim.lang.go.formatters = {
  {
    exe = "goimports"
  }
}
lvim.lang.python.formatters = {
	{
		exe = "black",
	},
}
lvim.lang.lua.formatters = {
	{
		exe = "stylua",
	},
}
lvim.lang.javascript.formatters = {
	{
		exe = "prettier",
	},
}
lvim.lang.rust.formatters = {
	{
		exe = "rustfmt",
	},
}

-- set an additional linter
lvim.lang.python.linters = {
	{
		exe = "flake8",
	},
}
lvim.lang.lua.linters = {
	{
		exe = "luacheck",
	},
}

-- Additional Plugins
lvim.plugins = {
	-- colorschemes
	{ "nanotech/jellybeans.vim" },
	{ "morhetz/gruvbox" },
	{ "skbolton/embark" },
	{ "bluz71/vim-nightfly-guicolors" },
	{ "bluz71/vim-moonfly-colors" },
	{ "christianchiarulli/nvcode-color-schemes.vim" },
	{ "dracula/vim" },
	{ "folke/tokyonight.nvim" },

	{ "tpope/vim-commentary" },
	{ "tpope/vim-repeat" },
	{ "tpope/vim-surround" },
	{ "tpope/vim-rhubarb" },
	{ "tpope/vim-dispatch" },
	{ "tpope/vim-fugitive" },

	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufRead",
		setup = function()
			vim.g.indentLine_enabled = 1
			vim.g.indent_blankline_char = "▏"
			vim.g.indent_blankline_filetype_exclude = { "help", "terminal", "dashboard" }
			vim.g.indent_blankline_buftype_exclude = { "terminal" }
			vim.g.indent_blankline_show_trailing_blankline_indent = false
			vim.g.indent_blankline_show_first_indent_level = false
		end,
	},
	{ "junegunn/fzf.vim", requires = {
		"junegunn/fzf",
		run = function()
			vim.fn["fzf#install()"]()
		end,
	} },

	{
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
	},
	{ "akinsho/nvim-toggleterm.lua" },
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
	{ "scalameta/nvim-metals" },
	{ "mizlan/iswap.nvim" },
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		event = "BufRead",
	},
	{ "tpope/vim-projectionist" },
	{ "vim-test/vim-test" },
	{ "kdheepak/lazygit.nvim" },
	{ "sunjon/Shade.nvim" },
	{ "folke/twilight.nvim" },
	{
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
	},
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	{ "mattn/emmet-vim" },
	{ "jiangmiao/auto-pairs" },
	{
		"nvim-treesitter/playground",
		event = "BufRead",
	},
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
	{ "BufWritePre", "*.rb", ":%s/s+$//e" },
	{ "BufWritePre", "*.go", ":%s/s+$//e" },
	{ "BufWritePre", "*.js", ":%s/s+$//e" },
	{ "BufWritePre", "*.html", ":%s/s+$//e" },
	{ "BufWritePre", "*.css", ":%s/s+$//e" },
	{ "BufWritePre", "*.scss", ":%s/s+$//e" },
	{ "BufWritePre", "*.yaml", ":%s/s+$//e" },
	{ "BufWritePre", "*.ex", ":%s/s+$//e" },
	{ "BufWritePre", "*.exs", ":%s/s+$//e" },
	{ "BufWritePre", "*.json", ":%s/s+$//e" },
	{ "BufWritePre", "*.py", ":%s/s+$//e" },
	{ "BufWritePre", "*.vim", ":%s/s+$//e" },
	{ "BufWritePre", "*.lua", ":%s/s+$//e" },
	{ "BufWritePre", "*.scala", ":%s/s+$//e" },
}

vim.opt.hlsearch = false
vim.opt.breakindent = true
vim.opt.showcmd = false
vim.o.showmode = false

-- File Reloading
vim.cmd([[
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
]])

vim.cmd([[
command! Q q
command! W w
command! Wq wq
command! WQ wq
command! Qw wq
command! QW wq
command! SO source $MYVIMRC
]])

vim.g.user_emmet_leader_key = "<C-Z>"

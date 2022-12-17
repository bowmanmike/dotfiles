local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"

  use "folke/tokyonight.nvim"
  use "bluz71/vim-moonfly-colors"

  use({
    "junegunn/fzf.vim",
    requires = {
      "junegunn/fzf",
      run = function()
        vim.fn["fzf#install"]()
      end,
    },
  })
  use({ "nvim-telescope/telescope.nvim", requires = {
    "nvim-lua/plenary.nvim",
    "nvim-lua/popup.nvim",
  } })
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make", requires = { "nvim-telescope/telescope.nvim" } })

  use("tpope/vim-commentary")
  use("tpope/vim-repeat")
  use("tpope/vim-surround")
  use("tpope/vim-rhubarb")
  use("tpope/vim-dispatch")
  use("tpope/vim-fugitive")
  use("tpope/vim-projectionist")
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
        current_line_blame = true,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
          delay = 100,
          ignore_whitespace = false,
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
  })
  use({
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "BufRead",
    -- config = {
    --   javascript = {
    --     __default = "// %s",
    --     jsx_element = "{/* %s */}",
    --     jsx_fragment = "{/* %s */}",
    --     jsx_attribute = "// %s",
    --     comment = "// %s",
    --   },
    -- },
  })
  use("nvim-treesitter/nvim-treesitter-textobjects")
  use("nvim-treesitter/playground")
  use({ "p00f/nvim-ts-rainbow" })
  use("windwp/nvim-ts-autotag")

  use("kdheepak/lazygit.nvim")
  use("vim-test/vim-test")

  use({
    "phaazon/hop.nvim",
    branch = "v2",
    config = function()
      require("hop").setup()
    end,
  })

  use("mizlan/iswap.nvim")
  use({
    "akinsho/git-conflict.nvim",
    config = function()
      require("git-conflict").setup()
    end,
  })

  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  })

  use({
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
    -- config = function()
    --   require("nvim-tree").setup({})
    -- end,
  })

  use({
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    -- config = function()
    --  require("trouble").setup({
    --    -- your configuration comes here
    --    -- or leave it empty to use the default settings
    --  })
    -- end,
  })

  -- use("neovim/nvim-lspconfig")
  -- use("williamboman/mason.nvim")
  -- use("williamboman/mason-lspconfig.nvim")

  use({
    "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  })

  use({ "mhanberg/elixir.nvim", requires = { "nvim-lua/plenary.nvim" } })
  use("mattn/emmet-vim")
  use("vim-ruby/vim-ruby")
  use("tpope/vim-rails")
  use("fatih/vim-go")

  -- use("onsails/lspkind-nvim")
  -- use({ 'hrsh7th/nvim-cmp', requires = {
  --   'hrsh7th/cmp-nvim-lsp',
  --   'hrsh7th/cmp-buffer',
  --   'hrsh7th/cmp-path',
  --   'hrsh7th/cmp-cmdline',
  -- } })

  -- For vsnip users.
  -- use('hrsh7th/cmp-vsnip')
  -- use('hrsh7th/vim-vsnip')

  -- For luasnip users.
  -- use('L3MON4D3/LuaSnip')
  -- use('saadparwaiz1/cmp_luasnip')
  -- use('rafamadriz/friendly-snippets')

  use({ 'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim' })

  use('RRethy/vim-illuminate')

  use({'scalameta/nvim-metals', requires = { 'nvim-lua/plenary.nvim' }})

  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }

  use("mbbill/undotree")

  if packer_bootstrap then
    require('packer').sync()
  end
end)

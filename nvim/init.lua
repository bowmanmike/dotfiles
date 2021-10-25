local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('packer').startup(function(use)
  use('wbthomason/packer.nvim')

  use('neovim/nvim-lspconfig')
  use('tamago324/nlsp-settings.nvim')
  use('jose-elias-alvarez/null-ls.nvim')
  use('antoinemadec/FixCursorHold.nvim')
  use('williamboman/nvim-lsp-installer')
  use{'nvim-telescope/telescope.nvim', requires = {
    'nvim-lua/plenary.nvim',
    'nvim-lua/popup.nvim'
  },
  config = function()
    require('lvim.core.telescope').setup()
  end
}

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


  if packer_bootstrap then
    require('packer').sync()
  end
end)

vim.o.backup = false
vim.o.clipboard = 'unnamed'
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.inccommand = 'nosplit'
vim.o.lazyredraw = true
vim.o.listchars = "tab:»·,trail:·,nbsp:·"
vim.o.mouse = 'a'    
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

vim.cmd [[ colorscheme moonfly ]]

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

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
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true })

-- -- vim.cmd('let mapleader = \"<space>\"')
-- -- vim.cmd('colorscheme embark')
-- -- vim.cmd('colorscheme moonfly')
-- -- vim.cmd('let g:nvcode_termcolors=256')
-- -- vim.cmd('hi LineNr ctermbg=NONE guibg=NONE')
-- core_options()
require('base')

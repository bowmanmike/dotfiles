local api = vim.api

local setOptions = function(options)
  for k, v in pairs(options) do
    if v == true then
      api.nvim_command('set ' .. k)
    elseif v == false then
      api.nvim_command('set no' .. k)
    else
      api.nvim_command('set ' .. k .. '=' .. v)
    end
  end
end

local core_options = function()
  local options = {
    backup = false,
    clipboard = 'unnamed',
    expandtab = true,
    hlsearch = false,
    ignorecase = true,
    inccommand = 'nosplit',
    lazyredraw = true,
    listchars = "tab:»·,trail:·,nbsp:·",
    mouse = 'a',
    number = true,
    scrolloff = 5,
    shiftround = true,
    shiftwidth = 2,
    showcmd = false,
    smartcase = true,
    splitbelow = true,
    splitright = true,
    swapfile = false,
    tabstop = 2,
    termguicolors = true,

    -- Undotree
    undodir = '~/.undodir',
    undofile = true,

    -- GitGutter
    updatetime = 100,
    signcolumn = 'yes',

    -- Lightline
    showtabline=2,

    -- LSP
    completeopt = 'menuone,noinsert,noselect'
  }

  setOptions(options)
end

-- vim.cmd('let mapleader = \"<space>\"')
vim.cmd('colorscheme embark')
core_options()

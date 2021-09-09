-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/mbowman/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/mbowman/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/mbowman/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/mbowman/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/mbowman/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/start/FixCursorHold.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/start/LuaSnip"
  },
  ["Shade.nvim"] = {
    loaded = true,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/start/Shade.nvim"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/start/auto-pairs"
  },
  ["barbar.nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20core.bufferline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/opt/barbar.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/start/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/start/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/start/cmp_luasnip"
  },
  ["dashboard-nvim"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19core.dashboard\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/opt/dashboard-nvim"
  },
  embark = {
    loaded = true,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/start/embark"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/start/emmet-vim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/start/friendly-snippets"
  },
  fzf = {
    loaded = true,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/start/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/start/fzf.vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18core.gitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/opt/gitsigns.nvim"
  },
  gruvbox = {
    loaded = true,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/start/gruvbox"
  },
  ["indent-blankline.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/opt/indent-blankline.nvim"
  },
  ["iswap.nvim"] = {
    loaded = true,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/start/iswap.nvim"
  },
  ["jellybeans.vim"] = {
    loaded = true,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/start/jellybeans.vim"
  },
  ["lazygit.nvim"] = {
    loaded = true,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/start/lazygit.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17core.lualine\frequire\0" },
    loaded = true,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/start/lualine.nvim"
  },
  ["nlsp-settings.nvim"] = {
    loaded = true,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/start/nlsp-settings.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/start/null-ls.nvim"
  },
  ["nvcode-color-schemes.vim"] = {
    loaded = true,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/start/nvcode-color-schemes.vim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19core.autopairs\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/opt/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "nvim-autopairs" },
    loaded = true,
    only_config = true
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n|\0\0\4\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\a\vcss_fn\2\bcss\2\vhsl_fn\2\vrgb_fn\2\rRRGGBBAA\2\vRRGGBB\2\bRGB\2\1\2\0\0\6*\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-comment"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17core.comment\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/opt/nvim-comment"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\1K\0\1\0\nsetup\20core.lspinstall\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/opt/nvim-lspinstall"
  },
  ["nvim-metals"] = {
    loaded = true,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/start/nvim-metals"
  },
  ["nvim-toggleterm.lua"] = {
    loaded = true,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/start/nvim-toggleterm.lua"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18core.nvimtree\frequire\0" },
    loaded = true,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20core.treesitter\frequire\0" },
    loaded = true,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-ts-autotag"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20nvim-ts-autotag\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/opt/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/opt/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/start/popup.nvim"
  },
  ["project.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17core.project\frequire\0" },
    loaded = true,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/start/project.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19core.telescope\frequire\0" },
    loaded = true,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/start/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18core.terminal\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/opt/toggleterm.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/start/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    commands = { "TroubleToggle" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/opt/trouble.nvim"
  },
  ["twilight.nvim"] = {
    loaded = true,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/start/twilight.nvim"
  },
  vim = {
    loaded = true,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/start/vim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/start/vim-dispatch"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-moonfly-colors"] = {
    loaded = true,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/start/vim-moonfly-colors"
  },
  ["vim-nightfly-guicolors"] = {
    loaded = true,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/start/vim-nightfly-guicolors"
  },
  ["vim-projectionist"] = {
    loaded = true,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/start/vim-projectionist"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/start/vim-rhubarb"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/start/vim-surround"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/start/vim-test"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19core.which-key\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/mbowman/.local/share/lunarvim/site/pack/packer/opt/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: indent-blankline.nvim
time([[Setup for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\nã\2\0\0\2\0\v\0\0256\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0006\0\0\0009\0\1\0005\1\6\0=\1\5\0006\0\0\0009\0\1\0005\1\b\0=\1\a\0006\0\0\0009\0\1\0+\1\1\0=\1\t\0006\0\0\0009\0\1\0+\1\1\0=\1\n\0K\0\1\0-indent_blankline_show_first_indent_level4indent_blankline_show_trailing_blankline_indent\1\2\0\0\rterminal%indent_blankline_buftype_exclude\1\4\0\0\thelp\rterminal\14dashboard&indent_blankline_filetype_exclude\bâ–\26indent_blankline_char\23indentLine_enabled\6g\bvim\0", "setup", "indent-blankline.nvim")
time([[Setup for indent-blankline.nvim]], false)
-- Setup for: nvim-ts-context-commentstring
time([[Setup for nvim-ts-context-commentstring]], true)
time([[Setup for nvim-ts-context-commentstring]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17core.lualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20core.treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17core.project\frequire\0", "config", "project.nvim")
time([[Config for project.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18core.nvimtree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n|\0\0\4\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\a\vcss_fn\2\bcss\2\vhsl_fn\2\vrgb_fn\2\rRRGGBBAA\2\vRRGGBB\2\bRGB\2\1\2\0\0\6*\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19core.telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rcore.cmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-autopairs ]]

-- Config for: nvim-autopairs
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19core.autopairs\frequire\0", "config", "nvim-autopairs")

time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TroubleToggle lua require("packer.load")({'trouble.nvim'}, { cmd = "TroubleToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-ts-autotag'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'gitsigns.nvim', 'indent-blankline.nvim', 'nvim-comment', 'nvim-ts-context-commentstring'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au BufWinEnter * ++once lua require("packer.load")({'toggleterm.nvim', 'which-key.nvim', 'barbar.nvim', 'dashboard-nvim'}, { event = "BufWinEnter *" }, _G.packer_plugins)]]
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'nvim-lspinstall'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end

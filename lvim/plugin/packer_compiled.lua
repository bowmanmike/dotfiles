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
local package_path_str = "/Users/mikebowman/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/mikebowman/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/mikebowman/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/mikebowman/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/mikebowman/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
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
  ["astronauta.nvim"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/lunarvim/site/pack/packer/start/astronauta.nvim"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/lunarvim/site/pack/packer/start/auto-pairs"
  },
  ["barbar.nvim"] = {
    config = { "\27LJ\2\n~\0\0\3\0\6\0\0156\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0009\0\4\0009\0\5\0\15\0\0\0X\1\5�6\0\2\0009\0\3\0009\0\4\0009\0\5\0B\0\1\1K\0\1\0\19on_config_done\15bufferline\vplugin\6O\20core.bufferline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/mikebowman/.local/share/lunarvim/site/pack/packer/opt/barbar.nvim"
  },
  ["dashboard-nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\5\0\a\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0009\0\6\0\15\0\0\0X\1\b�6\0\3\0009\0\4\0009\0\5\0009\0\6\0006\2\0\0'\4\5\0B\2\2\0A\0\0\1K\0\1\0\19on_config_done\14dashboard\vplugin\6O\nsetup\19core.dashboard\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/mikebowman/.local/share/lunarvim/site/pack/packer/opt/dashboard-nvim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/lunarvim/site/pack/packer/start/emmet-vim"
  },
  ["formatter.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\5\0\6\0\0186\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0009\0\4\0009\0\5\0\15\0\0\0X\1\b�6\0\2\0009\0\3\0009\0\4\0009\0\5\0006\2\0\0'\4\4\0B\2\2\0A\0\0\1K\0\1\0\19on_config_done\14formatter\vplugin\6O\19core.formatter\frequire\0" },
    loaded = true,
    path = "/Users/mikebowman/.local/share/lunarvim/site/pack/packer/start/formatter.nvim"
  },
  ["friendly-snippets"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/mikebowman/.local/share/lunarvim/site/pack/packer/opt/friendly-snippets"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\5\0\6\0\0186\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0009\0\4\0009\0\5\0\15\0\0\0X\1\b�6\0\2\0009\0\3\0009\0\4\0009\0\5\0006\2\0\0'\4\4\0B\2\2\0A\0\0\1K\0\1\0\19on_config_done\15galaxyline\vplugin\6O\20core.galaxyline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/mikebowman/.local/share/lunarvim/site/pack/packer/opt/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\5\0\a\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0009\0\6\0\15\0\0\0X\1\b�6\0\3\0009\0\4\0009\0\5\0009\0\6\0006\2\0\0'\4\5\0B\2\2\0A\0\0\1K\0\1\0\19on_config_done\rgitsigns\vplugin\6O\nsetup\18core.gitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/mikebowman/.local/share/lunarvim/site/pack/packer/opt/gitsigns.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n�\1\0\0\5\0\a\0\0186\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0009\0\4\0009\0\5\0\15\0\0\0X\1\b�6\0\2\0009\0\3\0009\0\4\0009\0\5\0006\2\0\0'\4\6\0B\2\2\0A\0\0\1K\0\1\0\19nvim-autopairs\19on_config_done\14autopairs\vplugin\6O\19core.autopairs\frequire\0" },
    loaded = true,
    path = "/Users/mikebowman/.local/share/lunarvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-comment"] = {
    config = { "\27LJ\2\n�\1\0\0\5\0\b\0\0226\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�K\0\1\0009\2\3\1B\2\1\0016\2\4\0009\2\5\0029\2\6\0029\2\a\2\15\0\2\0X\3\6�6\2\4\0009\2\5\0029\2\6\0029\2\a\2\18\4\1\0B\2\2\1K\0\1\0\19on_config_done\fcomment\vplugin\6O\nsetup\17nvim_comment\frequire\npcall\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/mikebowman/.local/share/lunarvim/site/pack/packer/opt/nvim-comment"
  },
  ["nvim-compe"] = {
    config = { "\27LJ\2\n�\1\0\0\5\0\a\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0009\0\6\0\15\0\0\0X\1\b�6\0\3\0009\0\4\0009\0\5\0009\0\6\0006\2\0\0'\4\5\0B\2\2\0A\0\0\1K\0\1\0\19on_config_done\ncompe\vplugin\6O\nsetup\15core.compe\frequire\0" },
    loaded = true,
    path = "/Users/mikebowman/.local/share/lunarvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lint"] = {
    config = { "\27LJ\2\n�\1\0\0\5\0\a\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0009\0\6\0\15\0\0\0X\1\b�6\0\3\0009\0\4\0009\0\5\0009\0\6\0006\2\0\0'\4\5\0B\2\2\0A\0\0\1K\0\1\0\19on_config_done\tlint\vplugin\6O\nsetup\16core.linter\frequire\0" },
    loaded = true,
    path = "/Users/mikebowman/.local/share/lunarvim/site/pack/packer/start/nvim-lint"
  },
  ["nvim-lsp-ts-utils"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/mikebowman/.local/share/lunarvim/site/pack/packer/opt/nvim-lsp-ts-utils"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/lunarvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    config = { "\27LJ\2\n�\1\0\0\4\0\6\0\0186\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0016\1\3\0009\1\4\0019\1\1\0019\1\5\1\15\0\1\0X\2\6�6\1\3\0009\1\4\0019\1\1\0019\1\5\1\18\3\0\0B\1\2\1K\0\1\0\19on_config_done\vplugin\6O\nsetup\15lspinstall\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/mikebowman/.local/share/lunarvim/site/pack/packer/opt/nvim-lspinstall"
  },
  ["nvim-metals"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/lunarvim/site/pack/packer/start/nvim-metals"
  },
  ["nvim-toggleterm.lua"] = {
    config = { "\27LJ\2\n�\1\0\0\5\0\b\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0009\0\6\0\15\0\0\0X\1\b�6\0\3\0009\0\4\0009\0\5\0009\0\6\0006\2\0\0'\4\a\0B\2\2\0A\0\0\1K\0\1\0\15toggleterm\19on_config_done\rterminal\vplugin\6O\nsetup\18core.terminal\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/mikebowman/.local/share/lunarvim/site/pack/packer/opt/nvim-toggleterm.lua"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n�\1\0\0\5\0\b\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0009\0\6\0\15\0\0\0X\1\b�6\0\3\0009\0\4\0009\0\5\0009\0\6\0006\2\0\0'\4\a\0B\2\2\0A\0\0\1K\0\1\0\21nvim-tree.config\19on_config_done\rnvimtree\vplugin\6O\nsetup\18core.nvimtree\frequire\0" },
    loaded = true,
    path = "/Users/mikebowman/.local/share/lunarvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n�\1\0\0\5\0\b\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0009\0\6\0\15\0\0\0X\1\b�6\0\3\0009\0\4\0009\0\5\0009\0\6\0006\2\0\0'\4\a\0B\2\2\0A\0\0\1K\0\1\0\28nvim-treesitter.configs\19on_config_done\15treesitter\vplugin\6O\nsetup\20core.treesitter\frequire\0" },
    loaded = true,
    path = "/Users/mikebowman/.local/share/lunarvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/lunarvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/lunarvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/lunarvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/lunarvim/site/pack/packer/start/popup.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\5\0\a\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0009\0\6\0\15\0\0\0X\1\b�6\0\3\0009\0\4\0009\0\5\0009\0\6\0006\2\0\0'\4\5\0B\2\2\0A\0\0\1K\0\1\0\19on_config_done\14telescope\vplugin\6O\nsetup\19core.telescope\frequire\0" },
    loaded = true,
    path = "/Users/mikebowman/.local/share/lunarvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-elixir"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/mikebowman/.local/share/lunarvim/site/pack/packer/opt/vim-elixir"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/lunarvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-moonfly-colors"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/lunarvim/site/pack/packer/start/vim-moonfly-colors"
  },
  ["vim-rooter"] = {
    config = { "\27LJ\2\n�\1\0\0\2\0\a\0\0166\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\3\0009\0\4\0009\0\5\0009\0\6\0\15\0\0\0X\1\5�6\0\3\0009\0\4\0009\0\5\0009\0\6\0B\0\1\1K\0\1\0\19on_config_done\vrooter\vplugin\6O\24rooter_silent_chdir\6g\bvim\0" },
    loaded = true,
    path = "/Users/mikebowman/.local/share/lunarvim/site/pack/packer/start/vim-rooter"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/lunarvim/site/pack/packer/start/vim-surround"
  },
  ["vim-vsnip"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/mikebowman/.local/share/lunarvim/site/pack/packer/opt/vim-vsnip"
  },
  vimtex = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/mikebowman/.local/share/lunarvim/site/pack/packer/opt/vimtex"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\5\0\b\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0009\0\6\0\15\0\0\0X\1\b�6\0\3\0009\0\4\0009\0\5\0009\0\6\0006\2\0\0'\4\a\0B\2\2\0A\0\0\1K\0\1\0\14which-key\19on_config_done\14which_key\vplugin\6O\nsetup\19core.which-key\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/mikebowman/.local/share/lunarvim/site/pack/packer/opt/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-compe
time([[Config for nvim-compe]], true)
try_loadstring("\27LJ\2\n�\1\0\0\5\0\a\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0009\0\6\0\15\0\0\0X\1\b�6\0\3\0009\0\4\0009\0\5\0009\0\6\0006\2\0\0'\4\5\0B\2\2\0A\0\0\1K\0\1\0\19on_config_done\ncompe\vplugin\6O\nsetup\15core.compe\frequire\0", "config", "nvim-compe")
time([[Config for nvim-compe]], false)
-- Config for: vim-rooter
time([[Config for vim-rooter]], true)
try_loadstring("\27LJ\2\n�\1\0\0\2\0\a\0\0166\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\3\0009\0\4\0009\0\5\0009\0\6\0\15\0\0\0X\1\5�6\0\3\0009\0\4\0009\0\5\0009\0\6\0B\0\1\1K\0\1\0\19on_config_done\vrooter\vplugin\6O\24rooter_silent_chdir\6g\bvim\0", "config", "vim-rooter")
time([[Config for vim-rooter]], false)
-- Config for: nvim-lint
time([[Config for nvim-lint]], true)
try_loadstring("\27LJ\2\n�\1\0\0\5\0\a\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0009\0\6\0\15\0\0\0X\1\b�6\0\3\0009\0\4\0009\0\5\0009\0\6\0006\2\0\0'\4\5\0B\2\2\0A\0\0\1K\0\1\0\19on_config_done\tlint\vplugin\6O\nsetup\16core.linter\frequire\0", "config", "nvim-lint")
time([[Config for nvim-lint]], false)
-- Config for: formatter.nvim
time([[Config for formatter.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\5\0\6\0\0186\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0009\0\4\0009\0\5\0\15\0\0\0X\1\b�6\0\2\0009\0\3\0009\0\4\0009\0\5\0006\2\0\0'\4\4\0B\2\2\0A\0\0\1K\0\1\0\19on_config_done\14formatter\vplugin\6O\19core.formatter\frequire\0", "config", "formatter.nvim")
time([[Config for formatter.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n�\1\0\0\5\0\b\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0009\0\6\0\15\0\0\0X\1\b�6\0\3\0009\0\4\0009\0\5\0009\0\6\0006\2\0\0'\4\a\0B\2\2\0A\0\0\1K\0\1\0\21nvim-tree.config\19on_config_done\rnvimtree\vplugin\6O\nsetup\18core.nvimtree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n�\1\0\0\5\0\b\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0009\0\6\0\15\0\0\0X\1\b�6\0\3\0009\0\4\0009\0\5\0009\0\6\0006\2\0\0'\4\a\0B\2\2\0A\0\0\1K\0\1\0\28nvim-treesitter.configs\19on_config_done\15treesitter\vplugin\6O\nsetup\20core.treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n�\1\0\0\5\0\a\0\0186\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0009\0\4\0009\0\5\0\15\0\0\0X\1\b�6\0\2\0009\0\3\0009\0\4\0009\0\5\0006\2\0\0'\4\6\0B\2\2\0A\0\0\1K\0\1\0\19nvim-autopairs\19on_config_done\14autopairs\vplugin\6O\19core.autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\5\0\a\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0009\0\6\0\15\0\0\0X\1\b�6\0\3\0009\0\4\0009\0\5\0009\0\6\0006\2\0\0'\4\5\0B\2\2\0A\0\0\1K\0\1\0\19on_config_done\14telescope\vplugin\6O\nsetup\19core.telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType eelixir ++once lua require("packer.load")({'vim-elixir'}, { ft = "eelixir" }, _G.packer_plugins)]]
vim.cmd [[au FileType euphoria3 ++once lua require("packer.load")({'vim-elixir'}, { ft = "euphoria3" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript.jsx ++once lua require("packer.load")({'nvim-lsp-ts-utils'}, { ft = "javascript.jsx" }, _G.packer_plugins)]]
vim.cmd [[au FileType elixir ++once lua require("packer.load")({'vim-elixir'}, { ft = "elixir" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'nvim-lsp-ts-utils'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascriptreact ++once lua require("packer.load")({'nvim-lsp-ts-utils'}, { ft = "javascriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescript ++once lua require("packer.load")({'nvim-lsp-ts-utils'}, { ft = "typescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescriptreact ++once lua require("packer.load")({'nvim-lsp-ts-utils'}, { ft = "typescriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'vimtex'}, { ft = "tex" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescript.tsx ++once lua require("packer.load")({'nvim-lsp-ts-utils'}, { ft = "typescript.tsx" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufWinEnter * ++once lua require("packer.load")({'nvim-toggleterm.lua', 'which-key.nvim', 'galaxyline.nvim', 'dashboard-nvim', 'barbar.nvim'}, { event = "BufWinEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'gitsigns.nvim', 'nvim-comment'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'vim-vsnip', 'friendly-snippets'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'nvim-lspinstall'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /Users/mikebowman/.local/share/lunarvim/site/pack/packer/opt/vim-elixir/ftdetect/elixir.vim]], true)
vim.cmd [[source /Users/mikebowman/.local/share/lunarvim/site/pack/packer/opt/vim-elixir/ftdetect/elixir.vim]]
time([[Sourcing ftdetect script at: /Users/mikebowman/.local/share/lunarvim/site/pack/packer/opt/vim-elixir/ftdetect/elixir.vim]], false)
time([[Sourcing ftdetect script at: /Users/mikebowman/.local/share/lunarvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], true)
vim.cmd [[source /Users/mikebowman/.local/share/lunarvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]]
time([[Sourcing ftdetect script at: /Users/mikebowman/.local/share/lunarvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end

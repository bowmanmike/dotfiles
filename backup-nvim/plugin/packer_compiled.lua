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
  LuaSnip = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/LuaSnip"
  },
  ["Shade.nvim"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/Shade.nvim"
  },
  ale = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/ale"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/auto-pairs"
  },
  ["efm-langserver"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/efm-langserver"
  },
  embark = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/embark"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/emmet-vim"
  },
  ["formatter.nvim"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/formatter.nvim"
  },
  fzf = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  gruvbox = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  harpoon = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/harpoon"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["iswap.nvim"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/iswap.nvim"
  },
  ["jellybeans.vim"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/jellybeans.vim"
  },
  ["lazygit.nvim"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/lazygit.nvim"
  },
  ["lsp_extensions.nvim"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/lsp_extensions.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  nerdtree = {
    commands = { "NERDTreeToggle" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/opt/nerdtree"
  },
  ["nvcode-color-schemes.vim"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/nvcode-color-schemes.vim"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-gps"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/nvim-gps"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-metals"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/nvim-metals"
  },
  ["nvim-toggleterm.lua"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/nvim-toggleterm.lua"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["onedark.vim"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/onedark.vim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["rust.vim"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/rust.vim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["twilight.nvim"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/twilight.nvim"
  },
  undotree = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/undotree"
  },
  vim = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/vim"
  },
  ["vim-coffee-script"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/vim-coffee-script"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/vim-dispatch"
  },
  ["vim-elixir"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/vim-elixir"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-go"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/opt/vim-go"
  },
  ["vim-graphql"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/opt/vim-graphql"
  },
  ["vim-hashicorp-tools"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/vim-hashicorp-tools"
  },
  ["vim-illuminate"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/vim-illuminate"
  },
  ["vim-javascript"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/vim-javascript"
  },
  ["vim-moonfly-colors"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/vim-moonfly-colors"
  },
  ["vim-nightfly-guicolors"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/vim-nightfly-guicolors"
  },
  ["vim-projectionist"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/vim-projectionist"
  },
  ["vim-rails"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/vim-rails"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/vim-rhubarb"
  },
  ["vim-ruby"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/vim-ruby"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/vim-test"
  },
  ["vim-toml"] = {
    loaded = true,
    path = "/Users/mikebowman/.local/share/nvim/site/pack/packer/start/vim-toml"
  }
}

time([[Defining packer_plugins]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NERDTreeToggle lua require("packer.load")({'nerdtree'}, { cmd = "NERDTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType graphql ++once lua require("packer.load")({'vim-graphql'}, { ft = "graphql" }, _G.packer_plugins)]]
vim.cmd [[au FileType go ++once lua require("packer.load")({'vim-go'}, { ft = "go" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /Users/mikebowman/.local/share/nvim/site/pack/packer/opt/vim-go/ftdetect/gofiletype.vim]], true)
vim.cmd [[source /Users/mikebowman/.local/share/nvim/site/pack/packer/opt/vim-go/ftdetect/gofiletype.vim]]
time([[Sourcing ftdetect script at: /Users/mikebowman/.local/share/nvim/site/pack/packer/opt/vim-go/ftdetect/gofiletype.vim]], false)
time([[Sourcing ftdetect script at: /Users/mikebowman/.local/share/nvim/site/pack/packer/opt/vim-graphql/ftdetect/graphql.vim]], true)
vim.cmd [[source /Users/mikebowman/.local/share/nvim/site/pack/packer/opt/vim-graphql/ftdetect/graphql.vim]]
time([[Sourcing ftdetect script at: /Users/mikebowman/.local/share/nvim/site/pack/packer/opt/vim-graphql/ftdetect/graphql.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end

vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function()
  use "wbthomason/packer.nvim"
  use "folke/tokyonight.nvim"
  use "bluz71/vim-moonfly-colors"
end)

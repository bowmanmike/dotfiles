local treesitter = require('nvim-treesitter.configs')
treesitter.setup {
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  },
  fold = {
    enable = true
  }
}

TreesitterStatusLine = function()
  local opts = {
    indicator_size = 100,
    type_patterns = { "module", "class", "function", "method" },
    transform_fn = function(line) return line end,
    separator = ' -> '
  }

  treesitter.statusline(opts)
end

-- local treesitter = require('nvim-treesitter.configs')
-- treesitter.setup {
--   highlight = {
--     enable = true
--   },
--   indent = {
--     enable = true
--   },
--   fold = {
--     enable = true
--   }
-- }

-- TreesitterStatusLine = function()
--   local opts = {
--     indicator_size = 100,
--     type_patterns = { "module", "class", "function", "method" },
--     transform_fn = function(line) return line end,
--     separator = ' -> '
--   }

--   treesitter.statusline(opts)
-- end
require('nvim-treesitter.configs').setup {
  ensure_installed = 'all',
  ignore_install = { 'haskell' },
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },
}

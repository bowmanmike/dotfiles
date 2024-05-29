return {
  'nvim-telescope/telescope.nvim', tag = '0.1.6',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function() 
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<C-p>', builtin.find_files, { noremap = true, silent = true})
    vim.keymap.set('n', '<C-t>', builtin.live_grep, { noremap = true, silent = true})
    vim.keymap.set('n', '<C-b>', builtin.buffers, { noremap = true, silent = true})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { noremap = true, silent = true})
  end
}

local remap = vim.api.nvim_set_keymap

remap('n', 'j', 'gj', { noremap=true })
remap('n', 'k', 'gk', { noremap=true })
remap('n', '<leader>z', ':tabnew %<cr>', { noremap=true })
remap('n', '<leader>ev', ':vsplit $MYVIMRC<cr>', { noremap=true })
remap('n', '<leader>cf', ':let @+ = expand("%")<cr>', { noremap=true })

remap('v', '<leader>P', '"_dP', { noremap=true })

remap('', '<C-h>', '<C-w>h', { noremap=true })
remap('', '<C-j>', '<C-w>j', { noremap=true })
remap('', '<C-k>', '<C-w>k', { noremap=true })
remap('', '<C-l>', '<C-w>l', { noremap=true })

remap('t', '<C-o>', '<C-\\><C-n>', { noremap=true })
remap('n', '<leader>th', ':split term://zsh<cr>', { noremap=true })
remap('n', '<leader>tv', ':vsplit term://zsh<cr>', { noremap=true })

 -- Fugitive
remap('n', '<leader>gs', ':Git<cr>', { noremap=true })
remap('n', '<leader>gd', ':Git diff<cr>', { noremap=true })
remap('n', '<leader>gb', ':Git blame<cr>', { noremap=true })

-- FZF
remap('n', '<C-p>', ':Files<cr>', { noremap=true, silent=true })
remap('n', '<C-b>', ':Buffers<cr>', { noremap=true, silent=true })
remap('n', '<C-t>', ':Rg<cr>', { noremap=true, silent=true })

-- NERDTree
remap('n', '<C-n>', ':NERDTreeToggle<cr>', { noremap=true })
remap('n', '<leader>n', ':NERDTreeFind<cr>', { noremap=true })

-- VimTest
remap('n', '<leader>tn', ':TestNearest<cr>', { noremap=true, silent=true })
remap('n', '<leader>tf', ':TestFile<cr>', { noremap=true, silent=true })
remap('n', '<leader>tl', ':TestLast<cr>', { noremap=true, silent=true })
-- remap('n', '<leader>tv', ':TestVisit<cr>', { noremap=true, silent=true })

-- LSP
remap('n', 'g[', '<cmd>PrevDiagnosticCycle<cr>', { noremap=true, silent=true })
remap('n', 'g]', '<cmd>NextDiagnosticCycle<cr>', { noremap=true, silent=true })
remap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', { noremap=true, silent=true })
remap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', { noremap=true, silent=true })
remap('n', 'gy', '<cmd>lua vim.lsp.buf.type_definition()<cr>', { noremap=true, silent=true })
remap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', { noremap=true, silent=true })
remap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<cr>', { noremap=true, silent=true })

-- Ruby
remap('n', '<leader>ss', ':call DispatchRspec()<cr>', { noremap=true })

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
remap('t', '<leader>th', ':split term://zsh<cr>', { noremap=true })
remap('t', '<leader>tv', ':vsplit term://zsh<cr>', { noremap=true })

 -- Fugitive
remap('n', '<leader>gs', ':Git<cr>', { noremap=true })
remap('n', '<leader>gd', ':Git diff<cr>', { noremap=true })
remap('n', '<leader>gb', ':Git blame<cr>', { noremap=true })

-- FZF
remap('n', '<silent> <C-p>', ':Files<cr>', { noremap=true })
remap('n', '<silent> <C-b>', ':Buffers<cr>', { noremap=true })
remap('n', '<silent> <C-t>', ':Rg<cr>', { noremap=true })

-- NERDTree
remap('n', '<C-n>', ':NERDTreeToggle<cr>', { noremap=true })
remap('n', '<leader>n', 'NERDTreeFind<cr>', { noremap=true })

-- VimTest
remap('n', '<silent> <leader>tn', ':TestNearest<cr>', { noremap=true })
remap('n', '<silent> <leader>tf', ':TestFile<cr>', { noremap=true })
remap('n', '<silent> <leader>tl', ':TestLast<cr>', { noremap=true })
remap('n', '<silent> <leader>tv', ':TestVisit<cr>', { noremap=true })

-- LSP
remap('n', '<silent> g[', '<cmd>PrevDiagnosticCycle<cr>', { noremap=true })
remap('n', '<silent> g]', '<cmd>NextDiagnosticCycle<cr>', { noremap=true })
remap('n', '<silent> gd', '<cmd>lua vim.lsp.buf.definition()<cr>', { noremap=true })
remap('n', '<silent> K', '<cmd>lua vim.lsp.buf.hover()<cr>', { noremap=true })
remap('n', '<silent> gy', '<cmd>lua vim.lsp.buf.type_definition()<cr>', { noremap=true })
remap('n', '<silent> <leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', { noremap=true })

-- Ruby
remap('n', '<leader>ss', ':call DispatchRspec()<cr>', { noremap=true })

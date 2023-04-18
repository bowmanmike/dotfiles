local nnoremap = require("mike.keymap").nnoremap

vim.api.nvim_set_keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

vim.cmd([[
  function PrettyPrintJSON()
    :%!jq '.' -M
  endfunction

  function! MinifyJSON()
    :%!jq '.' -cM
  endfunction

  autocmd FileType json nmap <leader>pj :call PrettyPrintJSON()<cr>
  autocmd FileType json nmap <leader>mj :call MinifyJSON()<cr>
]])

vim.api.nvim_set_keymap("n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
vim.api.nvim_set_keymap("n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

vim.cmd([[
command! Q q
command! W w
command! Wq wq
command! WQ wq
command! Qw wq
command! QW wq
command! SO luafile $MYVIMRC
command! SF luafile %
]])

nnoremap("<leader>cf", ':let @+ = expand("%")<cr>')

vim.api.nvim_set_keymap("t", "<C-o>", "<C-\\><C-n>", { noremap = true })

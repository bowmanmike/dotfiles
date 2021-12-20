vim.cmd([[
  autocmd FileType elixir nmap <leader>pr orequire IEx; IEx.pry()<esc>
  autocmd FileType elixir nnoremap <leader>in oIO.inspect()<esc>i
  ]])

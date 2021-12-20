vim.cmd([[
  autocmd FileType ruby nnoremap <leader>pr orequire "pry-byebug"; binding.pry<esc>
  ]])

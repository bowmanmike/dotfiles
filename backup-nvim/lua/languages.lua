-- Elixir
vim.cmd [[
  autocmd FileType elixir nnoremap <leader>mf :!mix format<cr>
  autocmd FileType elixir nnoremap <leader>pr orequire IEx; IEx.pry()<esc>
  autocmd FileType elixir nnoremap <leader>ie :IEx<cr>
  autocmd FileType elixir nnoremap <leader>in oIO.inspect()<esc>i
  autocmd FileType elixir setlocal foldlevel=20
]]

-- Ruby
vim.cmd [[ autocmd FileType ruby nnoremap <leader>pr orequire "pry-byebug"; binding.pry<esc> ]]

-- JSON
vim.cmd [[
  autocmd FileType json set tabstop=2|set shiftwidth=2|set expandtab|set smarttab
  autocmd FileType json set foldmethod=syntax
  au FileType json nmap <leader>pj :call PrettyPrintJSON()<cr>

  function! PrettyPrintJSON()
    :%!jq '.' -M
  endfunction

  function! MinifyJSON()
    :%!jq '.' -cM
  endfunction

  autocmd FileType json nmap <leader>pj :call PrettyPrintJSON()<cr>
  autocmd FileType json nmap <leader>mj :call MinifyJSON()<cr>
]]
vim.g.vim_json_syntax_conceal = false

-- YAML
vim.cmd [[ autocmd FileType yaml set tabstop=2|set shiftwidth=2|set expandtab|set smarttab ]]

-- Markdown
vim.cmd [[ autocmd FileType md set tabstop=2|set shiftwidth=2|set expandtab|set smarttab ]]

-- Go
vim.g.go_fmt_command = 'goimports'
vim.g.go_highlight_functions = true
vim.g.go_highlight_function_calls = 1
vim.g.go_highlight_fields = 1
vim.g.go_highlight_types = 1
vim.g.go_highlight_build_constraints = 1
vim.g.go_fmt_fail_silently = 1
vim.g.go_auto_sameids = 1
vim.g.go_list_type = "quickfix"

vim.cmd [[
  au FileType go nmap <leader>r <Plug>(go-run)
  autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)
  au FileType go nmap <Leader>e <Plug>(go-rename)
  autocmd FileType go nmap <Leader>t <Plug>(go-test)
  autocmd FileType go nmap <Leader>dc :GoDoc<cr>
  autocmd FileType go nmap <Leader>c :GoCoverage<cr>
  autocmd FileType go nmap <Leader>cl :GoCoverageClear<cr>
  autocmd FileType go nmap <Leader>i :GoInfo<cr>
  autocmd FileType go nmap <Leader>d <Plug>(go-def-vertical)
  autocmd FileType go nmap <Leader>b <Plug>(go-def-tab)
  autocmd FileType go nmap <Leader>dd :GoDeclsDir<cr>
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
]]

-- Python
vim.cmd [[
  autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab
  autocmd FileType python nmap <leader>pd oimport pdb; pdb.set_trace()<esc> " Add pdb to the next line down
]]

-- Rust
vim.cmd [[ autocmd FileType rust nmap <leader>cc :Cargo check<cr> ]]
vim.g.rustfmt_autosave = true

vim.g.go_fmt_command = "goimports"
vim.g.go_highlight_functions = true
vim.g.go_highlight_function_calls = 1
vim.g.go_highlight_fields = 1
vim.g.go_highlight_types = 1
vim.g.go_highlight_build_constraints = 1
vim.g.go_fmt_fail_silently = 1
vim.g.go_auto_sameids = 1
vim.g.go_list_type = "quickfix"

vim.cmd([[
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
]])


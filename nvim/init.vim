call plug#begin('~/.local/share/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'dense-analysis/ale'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-projectionist'
Plug 'janko/vim-test'

Plug 'nanotech/jellybeans.vim'
Plug 'morhetz/gruvbox'
Plug 'skbolton/embark'

Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'pangloss/vim-javascript'
Plug 'elixir-editors/vim-elixir'
Plug 'mattn/emmet-vim'
Plug 'othree/html5-syntax.vim'
Plug 'jparise/vim-graphql', { 'for': 'graphql' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'cespare/vim-toml'
Plug 'hashivim/vim-terraform'

" Experiments
Plug 'rust-lang/rust.vim'
Plug 'mbbill/undotree'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'tjdevries/lsp_extensions.nvim'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/diagnostic-nvim'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter'

call plug#end()

" Basic Settings

let mapleader = "\<space>"

" Let's save undo info!
if !isdirectory($HOME."/.undodir")
    call mkdir($HOME."/.undodir", "", 0770)
endif
if !isdirectory($HOME."/.undodir")
    call mkdir($HOME."/.undodir", "", 0700)
endif

" File Reloading
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
autocmd FileChangedShellPost *
      \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" Strip trailing whitespace
au BufWritePre *.rb :%s/\s\+$//e
au BufWritePre *.go :%s/\s\+$//e
au BufWritePre *.js :%s/\s\+$//e
au BufWritePre *.html :%s/\s\+$//e
au BufWritePre *.css :%s/\s\+$//e
au BufWritePre *.scss :%s/\s\+$//e
au BufWritePre *.yaml :%s/\s\+$//e
au BufWritePre *.ex :%s/\s\+$//e
au BufWritePre *.exs :%s/\s\+$//e
au BufWritePre *.json :%s/\s\+$//e
au BufWritePre *.py :%s/\s\+$//e
au BufWritePre *.vim :%s/\s\+$//e

" ----- Keymappings -----

" Command Mode
command! Q q
command! W w
command! Wq wq
command! WQ wq
command! Qw wq
command! QW wq
command! SO source $MYVIMRC

" FZF
let g:fzf_nvim_statusline = 0

" GitGutter

" Lightline
let g:lightline = {
      \ 'colorscheme': 'embark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'filename': 'LightLineFilename'
      \ },
      \ }

let g:lightline.tabline = {
      \'left': [ ['tabs'] ],
      \'right': [ ['close'] ]
      \}

function! LightLineFilename()
  return expand('%')
endfunction

" set showtabline=2
set guioptions-=e

" ALE
let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_sign_column_always = 1
let g:ale_linters = {}
let g:ale_linters['go'] = ['golint', 'go vet', 'go build']
let g:ale_linters['scss'] = ['scsslint']
let g:ale_linters['css'] = ['scsslint']
let g:ale_linters['elixir'] = []
" let g:ale_linters['elixir'] = ['credo',  'elixir-ls', 'dogma']
" let g:ale_linters['elixir'] = ['credo', 'elixir-ls']
" let g:ale_linters['elixir'] = []
" let g:ale_linters['elixir'] = ['elixir-ls']
let g:ale_pattern_options = {
      \ '.*/node_modules/*.js': {
      \ 'ale_enabled': 0
      \},
      \ '.*/schema.rb': {
      \ 'ale_enabled': 0
      \}
      \}
" let g:ale_fixers = {}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'elixir': ['mix_format']
\}

let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 0
let g:ale_linters_explicit = 1

let g:ale_elixir_elixir_ls_release='~/.cache/nvim/nvim_lsp/elixirls/elixir-ls/release/language_server.sh'

" NERDTree
let g:NERDTreeShowHidden=1

" VimTest
let test#strategy = "neovim"
" let b:in_sports_reop = split(execute("pwd"), "/")[-1] == sports
"   let b:current_proj = split(expand("%"), "/")[0]
" endif
" function! SetCWDForTest()
"     let b:cwd = execute("pwd")
"     let b:current_proj = split(expand("%"), "/")[0]
"     let b:sports_repo = split(b:cwd, "/")

"     if b:sports_repo[-1] == "sports"
"       let test#project_root = join([b:cwd, b:current_proj], "/")
"       echo test#project_root
"     endif

"     " echo b:sports_repo[-1]
"     " echo b:current_proj
" endfunction


" ------ Language Settings ------

" Elixir
autocmd FileType elixir nnoremap <leader>mf :!mix format<cr>
autocmd FileType elixir nnoremap <leader>pr orequire IEx; IEx.pry()<esc> " Add IEx.pry() to the next line down
autocmd FileType elixir nnoremap <leader>ie :IEx<cr>
autocmd FileType elixir nnoremap <leader>in oIO.inspect()<esc>i
autocmd FileType elixir setlocal foldmethod=syntax
autocmd FileType elixir setlocal foldlevel=20

" HTML
let g:user_emmet_leader_key='<C-Z>'

" Ruby
autocmd FileType ruby nnoremap <leader>pr orequire "pry-byebug"; binding.pry<esc>

function! DispatchRspec()
  execute ":Dispatch bundle exec rspec --no-color --no-profile -f p %"
endfunction

" JSON
autocmd FileType json set tabstop=2|set shiftwidth=2|set expandtab|set smarttab
autocmd FileType json set foldmethod=syntax
let g:vim_json_syntax_conceal = 0

function! PrettyPrintJSON()
  :%!jq '.' -M
endfunction

function! MinifyJSON()
  :%!jq '.' -cM
endfunction

autocmd FileType json nmap <leader>pj :call PrettyPrintJSON()<cr>
autocmd FileType json nmap <leader>mj :call MinifyJSON()<cr>

" YAML
autocmd FileType yaml set tabstop=2|set shiftwidth=2|set expandtab|set smarttab

" Markdown
autocmd FileType md set tabstop=2|set shiftwidth=2|set expandtab|set smarttab

" Go
autocmd FileType go set tabstop=4|set shiftwidth=4|set noexpandtab
autocmd FileType gohtmltmpl set tabstop=2|set shiftwidth=2|set expandtab|set smarttab
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_fail_silently = 1
let g:go_auto_sameids = 1
let g:go_list_type = "quickfix"

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

" Python
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab
autocmd FileType python nmap <leader>pd oimport pdb; pdb.set_trace()<esc> " Add pdb to the next line down

" Use homebrew installs of python 2 and 3, I think ASDF versions are super
" slow to startup
let g:python3_host_prog = '/usr/local/bin/python3'
let g:python_host_prog = '/usr/local/bin/python2'

" Projectionist
let g:projectionist_heuristics = {
      \   "lib/scorepay/": {
      \     "lib/**/schema/*.ex": {"type": "ecto"},
      \     "lib/scorepay_web/schema/types/*.ex": {"type": "type", "related": "lib/scorepay_web/schema/resolvers/{basename}.ex", "template": ["defmodule ScorePayWeb.Schema.Types.NAME do", "  use ScorePayWeb.Schema.Notation", "", "  DEFINITION", "", "end"]},
      \     "lib/scorepay_web/schema/resolvers/*.ex": {"type": "res"}
      \   },
      \   "mix.exs": {
      \     "lib/*.ex": {
      \       "alternate": "test/{}_test.exs",
      \       "type": "source",
      \       "template": [
      \         "defmodule {camelcase|capitalize|dot} do",
      \         "end"
      \       ]
      \     },
      \     "test/*_test.exs": {
      \       "alternate": "lib/{}.ex",
      \       "type": "test",
      \       "template": [
      \         "defmodule {camelcase|capitalize|dot}Test do",
      \         "  use {camelcase|capitalize|dot}.DataCase, async: true",
      \         "",
      \         "  alias {camelcase|capitalize|dot}",
      \         "end"
      \       ]
      \     },
      \     "lib/**/controllers/*_controller.ex": {
      \       "type": "controller",
      \       "alternate": "test/{dirname}/controllers/{basename}_controller_test.exs",
      \       "template": [
      \         "defmodule {dirname|camelcase|capitalize}.{basename|camelcase|capitalize}Controller do",
      \         "  use {dirname|camelcase|capitalize}, :controller",
      \         "end"
      \       ]
      \     },
      \     "test/**/controllers/*_controller_test.exs": {
      \       "alternate": "lib/{dirname}/controllers/{basename}_controller.ex",
      \       "type": "test",
      \       "template": [
      \         "defmodule {dirname|camelcase|capitalize}.{basename|camelcase|capitalize}ControllerTest do",
      \         "  use {dirname|camelcase|capitalize}.ConnCase, async: true",
      \         "end"
      \       ]
      \     }
      \   }
      \ }


" ----- Testing Stuff -----

" === LSP ===
" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu

" Avoid showing extra messages when using completion
set shortmess+=c

" Configure LSP
" https://github.com/neovim/nvim-lspconfig#rust_analyzer

" Visualize diagnostics
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_trimmed_virtual_text = '40'
" Don't show diagnostics while in insert mode
let g:diagnostic_insert_delay = 1

" Show diagnostic popup on cursor hover
autocmd CursorHold * lua vim.lsp.util.show_line_diagnostics()

" Enable type inlay hints
" autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
" \ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment" }

" Trigger completion with <Tab>
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ completion#trigger_completion()

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Code navigation shortcuts
" nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> gy <cmd>lua vim.lsp.buf.type_definition()<CR>
" nnoremap <silent> <leader>ca <cmd>lua vim.lsp.buf.code_action()<CR>
" nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
" nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
" nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
" nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
" nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>

let g:rustfmt_autosave = 1

lua require("init")

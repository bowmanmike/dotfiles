call plug#begin('~/.local/share/nvim/plugged')

" Utilities
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'
Plug 'justinmk/vim-sneak'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Language Plugins
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'mhinz/vim-mix-format', { 'for': 'elixir' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'othree/html5-syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-rails'
Plug 'leafgarland/typescript-vim'
Plug 'rhysd/vim-crystal', { 'for': 'crystal' }
Plug 'jparise/vim-graphql', { 'for': 'graphql' }
Plug 'mattn/emmet-vim'
" Plug 'zxqfl/tabnine-vim' " Cool alternative to LangServer. Free version only indexes 200kb, need more

" Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'for': 'go' }
Plug 'mhartington/nvim-typescript', { 'do': './install.sh', 'for': 'typescript' }
Plug 'carlitux/deoplete-ternjs', { 'for': 'javascript' }
Plug 'Shougo/neosnippet' | Plug 'Shougo/neosnippet-snippets'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'Shougo/deoplete-clangx'
" Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }

" Other
Plug 'nanotech/jellybeans.vim'

call plug#end()

" ----- Basic Settings -----
syntax on
colorscheme jellybeans
let mapleader = "\<space>"

set number
set nohls
set ignorecase
set smartcase
set clipboard=unnamed
set completeopt-=preview
set splitright
set splitbelow
set cursorline
set mouse=a
set list listchars=tab:»·,trail:·,nbsp:·
filetype plugin indent on
set nobackup
set nowritebackup
set noswapfile
set scrolloff=5
set backspace=indent,eol,start
set laststatus=2
set noshowcmd

" Default tab settings
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=0
set smarttab

" File reload
set autoread
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

" Language Server
set hidden
let g:LanguageClient_serverCommands = {
      \ 'python': ['pyls'],
      \ 'ruby': ['solargraph', 'stdio']
      \}

" ALE
let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_sign_column_always = 1
let g:ale_linters = {}
let g:ale_linters['go'] = ['golint', 'go vet', 'go build']
let g:ale_linters['scss'] = ['scsslint']
let g:ale_linters['css'] = ['scsslint']
let g:ale_pattern_options = {
      \ '.*/node_modules/*.js': {
      \ 'ale_enabled': 0
      \},
      \ '.*/schema.rb': {
      \ 'ale_enabled': 0
      \}
    \}

let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1

" Nerdtree
let g:NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR>

" GitGutter
set updatetime=100

" Lightline
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'filename': 'LightLineFilename'
      \ },
      \ }

let g:lightline.tabline = {
  \   'left': [ ['tabs'] ],
  \   'right': [ ['close'] ]
  \ }

function! LightLineFilename()
  return expand('%')
endfunction

set showtabline=2
set guioptions-=e

" ----- Keymappings -----

" Normal Mode
nmap j gj
nmap k gk
nmap 0 ^
nmap <leader>z :tabnew %<cr>

" Command Mode
command! Q q
command! W w
command! Wq wq
command! WQ wq
command! Qw wq
command! QW wq
command! SO source $MYVIMRC

" Window Navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Fugitive
nmap <Leader>gs :Gstatus<cr>
nmap <Leader>gd :Gdiff<cr>
nmap <Leader>gb :Gblame<cr>

" FZF
nnoremap <silent> <C-p> :Files<cr>
nnoremap <silent> <C-b> :Buffers<cr>
nnoremap <silent> <C-t> :Tags<cr>
let g:fzf_nvim_statusline = 0
nnoremap <C-t> :Rg<cr>

" Language Server
nnoremap <silent> <leader>r :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>

" Deoplete
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_start_length=1
let g:deoplete#sources#go#sort_class = ['package', 'func', 'var', 'type', 'const']
let g:neosnippet#enable_completed_snippet = 1
let g:deoplete#sources#ternjs#filetypes = ['javascript', 'jsx', 'javascript.jsx', 'vue']
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" ----- Language Specific Settings -----

" Go
augroup settings_go
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
augroup end

" Python
augroup settings_python
  autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab
augroup end

" JSON
augroup settings_json
  autocmd FileType json set tabstop=2|set shiftwidth=2|set expandtab|set smarttab
  let g:vim_json_syntax_conceal = 0

  function! PrettyPrintJSON()
    :%!jq '.' -M
  endfunction

  function! MinifyJSON()
    :%!jq '.' -cM
  endfunction

  autocmd FileType json nmap <leader>pj :call PrettyPrintJSON()<cr>
  autocmd FileType json nmap <leader>mj :call MinifyJSON()<cr>
augroup end

" YAML
augroup settings_yaml
  autocmd FileType yaml set tabstop=2|set shiftwidth=2|set expandtab|set smarttab
augroup end

" Markdown
augroup settings_markdown
  autocmd FileType md set tabstop=2|set shiftwidth=2|set expandtab|set smarttab
augroup end

" HTML
augroup settings_html
  let g:user_emmet_leader_key='<C-Z>'
  let g:user_emmet_settings = {
        \'javascript.jsx': {
          \'extends': 'jsx',
          \'quote_char': "'",
          \}
        \}
augroup end

" Javascript
augroup settings_javascript
  let g:jsx_ext_required = 0
augroup end

" Ruby
augroup settings_ruby
  nmap <leader>pr orequire "pry-byebug"; binding.pry<esc> " Add binding.pry to the next line down
augroup end

" Crystal
augroup settings_crystal
  let g:crystal_auto_format = 1
augroup end

" Elixir
augroup settings_elixir
  autocmd FileType elixir set formatprg=mix\ format\ -
  let g:mix_format_on_save = 1
  let g:mix_format_silent_errors = 1
augroup end

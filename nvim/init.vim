call plug#begin('~/.local/share/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
" Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'dense-analysis/ale'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-projectionist'
Plug 'janko/vim-test'

Plug 'nanotech/jellybeans.vim'
Plug 'morhetz/gruvbox'

Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'pangloss/vim-javascript'
Plug 'elixir-editors/vim-elixir'
" Plug 'mhinz/vim-mix-format'
Plug 'mattn/emmet-vim'
Plug 'othree/html5-syntax.vim'
Plug 'jparise/vim-graphql', { 'for': 'graphql' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'cespare/vim-toml'
" Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }

" Plug 'autozimu/LanguageClient-neovim', {
"       \ 'branch': 'next',
"       \ 'do': 'bash install.sh'
"       \ }

" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Experiments
Plug 'rust-lang/rust.vim'

call plug#end()

" Basic Settings

syntax on
colorscheme jellybeans
let mapleader = "\<space>"
filetype plugin indent on

set backspace=indent,eol,start
set clipboard=unnamed
set cursorline
set ignorecase
set laststatus=2
set lazyredraw
set list listchars=tab:»·,trail:·,nbsp:·
set mouse=a
set nobackup
set nohls
set noshowcmd
set noswapfile
set number
" set relativenumber
set scrolloff=5
set smartcase
set splitbelow
set splitright

" Tab Settings
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=0
set smarttab
set shiftround

" Live Previews for Substitutions
set inccommand=nosplit

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

" Normal Mode
nnoremap j gj
nnoremap k gk
nnoremap 0 ^
nnoremap <leader>z :tabnew %<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>cf :let @+ = expand("%")<cr>

" Command Mode
command! Q q
command! W w
command! Wq wq
command! WQ wq
command! Qw wq
command! QW wq
command! SO source $MYVIMRC

" Window Navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Terminal commands
tnoremap <C-o> <C-\><C-n>
nnoremap <leader>th :split term://zsh<cr>
nnoremap <leader>tv :vsplit term://zsh<cr>


" Fugitive
nnoremap <Leader>gs :Git<cr>
nnoremap <Leader>gd :Git diff<cr>
nnoremap <Leader>gb :Git blame<cr>

" FZF
nnoremap <silent> <C-p> :Files<cr>
nnoremap <silent> <C-b> :Buffers<cr>
let g:fzf_nvim_statusline = 0
nnoremap <C-t> :Rg<cr>
" nnoremap <C-h> :Helptags<cr>

" GitGutter
set updatetime=100
set signcolumn=yes

" Lightline
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
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

set showtabline=2
set guioptions-=e

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

" NERDTree
let g:NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR>
nmap <leader>n :NERDTreeFind<CR>

" VimTest
nnoremap <silent> <leader>tn :TestNearest<CR>
nnoremap <silent> <leader>tf :TestFile<CR>
let test#strategy = "neovim"

" ------ Language Settings ------

" Elixir
autocmd FileType elixir set formatprg=mix\ format\ -
" autocmd FileType elixir set foldmethod=syntax
" autocmd FileType elixir set foldlevel=20
" let g:mix_format_on_save = 1
" let g:mix_format_silent_errors = 1

autocmd FileType elixir nnoremap <leader>mf :!mix format<cr>
autocmd FileType elixir nnoremap <leader>mt :Dispatch mix test %<cr>
autocmd FileType elixir nnoremap <leader>ml :Dispatch mix lint %<cr>
autocmd FileType elixir nnoremap <leader>pr orequire IEx; IEx.pry()<esc> " Add IEx.pry() to the next line down
autocmd FileType elixir nnoremap <leader>ie :IEx<cr>
autocmd FileType elixir nnoremap <leader>in oIO.inspect()<esc>i
autocmd FileType elixir setlocal foldmethod=syntax
autocmd FileType elixir setlocal foldlevel=20

" HTML
let g:user_emmet_leader_key='<C-Z>'

" Ruby
autocmd FileType ruby nnoremap <leader>pr orequire "pry-byebug"; binding.pry<esc>
nmap <leader>ss :call DispatchRspec()<cr>

function! DispatchRspec()
  execute ":Dispatch bundle exec rspec --no-color --no-profile -f p %"
endfunction

" JSON
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

" ----- Language Server/Completion -----
" let g:deoplete#enable_at_startup = 0

" let g:LanguageClient_serverCommands = {
"       \ 'elixir': ['~/coding/elixir/elixir-ls/release/language_server.sh'],
"       \ 'go': ['~/golang/bin/gopls'],
"       \ 'javascript': ['~/.asdf/shims/javascript-typescript-stdio'],
"       \ 'python': ['/usr/local/bin/pyls'],
"       \ 'ruby': ['~/.asdf/shims/solargraph', 'stdio'],
"       \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
"       \ 'typescript': ['~/.asdf/shims/javascript-typescript-stdio'],
"       \ }

" let g:LanguageClient_loggingFile = expand("/tmp/nvim-LanguageClient.log")
" let g:LanguageClient_textDocument_hover = 1
" let g:LanguageClient_useFloatingHover = 1
" let g:LanguageClient_hoverPreview = 'Never'
" let g:LanguageClient_useVirtualText = "No"
" set completefunc=LanguageClient#complete
" set completeopt-=preview
" set omnifunc=LanguageClient#complete

" Enable to debug LanguageServer issues
" let g:LanguageClient_loggingFile="/Users/mbowman/Desktop/lc.log"
" let g:LanguageClient_loggingLevel="DEBUG"

" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> gD :call LanguageClient#textDocument_definition({'gotoCmd': 'split'})<CR>
" nnoremap <silent> <leader>R :call LanguageClient#textDocument_rename()<CR>

" Use homebrew installs of python 2 and 3, I think ASDF versions are super
" slow to startup
let g:python3_host_prog = '/usr/local/bin/python3'
let g:python_host_prog = '/usr/local/bin/python2'

" Projectionist
let g:projectionist_heuristics = {
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
      \         "  use ScorePay.DataCase, async: true",
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

let g:rustfmt_autosave = 1

" COC

set cmdheight=2
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col-1] =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

if has('patch8.1.1068')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD :call CocAction('jumpDefinition', 'split')<cr>
nmap <silent> gB :call CocAction('jumpDefinition', 'tabe')<cr>
nmap <silent> gy <Plug>(coc-type-definition)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nmap <leader>rn <Plug>(coc-rename)

" set shortmess+=c
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_backspace() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_backspace() abort
"   let col = col(".") - 1
"   return !col || getline(".")[col - 1] =~# '\s'
" endfunction

" let g:fzf_commits_log_options = '--graph --color=always
"   \ --format="%C(yellow)%h%C(red)%d%C(reset)
"   \ - %C(bold green)(%ar)%C(reset) %s %C(blue)<%an>%C(reset)"'


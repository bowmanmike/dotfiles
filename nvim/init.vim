call plug#begin('~/.local/share/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

Plug 'nanotech/jellybeans.vim'
Plug 'morhetz/gruvbox'

Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'pangloss/vim-javascript'
Plug 'elixir-lang/vim-elixir'
Plug 'mhinz/vim-mix-format'
Plug 'mattn/emmet-vim'
Plug 'othree/html5-syntax.vim'
Plug 'jparise/vim-graphql', { 'for': 'graphql' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }

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
tnoremap <Esc> <C-\><C-n> " This causes issues with FZF. Keep in mind
nnoremap <leader>th :split term://zsh<cr>
nnoremap <leader>tv :vsplit term://zsh<cr>


" Fugitive
nnoremap <Leader>gs :Gstatus<cr>
nnoremap <Leader>gd :Gdiff<cr>
nnoremap <Leader>gb :Gblame<cr>

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

" ------ Language Settings ------

" Elixir
autocmd FileType elixir set formatprg=mix\ format\ -
let g:mix_format_on_save = 1
let g:mix_format_silent_errors = 1

nnoremap <leader>mt :Dispatch mix test %<cr>
nmap <leader>pr orequire IEx; IEx.pry()<esc> " Add IEx.pry() to the next line down

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

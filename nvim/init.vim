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
au BufWritePre *.vimwiki :%s/\s\+$//e
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

let g:mix_format_on_save = 1
let g:mix_format_silent_errors = 1

nnoremap <leader>mt :Dispatch mix test %<cr>
nmap <leader>pr orequire IEx; IEx.pry()<esc> " Add IEx.pry() to the next line down

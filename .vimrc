" ----- Vim-plug -----
call plug#begin()

Plug 'jiangmiao/auto-pairs' " Automatically fill in closing delimiters
Plug 'ctrlpvim/ctrlp.vim' " Fuzzy finder
Plug 'mattn/emmet-vim' " Emmet for awesome HTML
Plug 'nanotech/jellybeans.vim' " Jellybeans colorscheme
Plug 'fatih/vim-go' " Go language support
Plug 'Yggdroot/indentLine' " Display vertical lines to guide indentation
Plug 'tpope/vim-commentary' " Easily comment and uncomment text
Plug 'tpope/vim-fugitive' " Sweet git integration
Plug 'airblade/vim-gitgutter' " Show git information in linenumbers
Plug 'pangloss/vim-javascript' " Javascript language support
Plug 'tpope/vim-repeat' " Allow other plugins to hook into the . command
Plug 'thoughtbot/vim-rspec' " Run RSpec tests from vim
Plug 'vim-ruby/vim-ruby' " Ruby language support
Plug 'tpope/vim-surround' " Add, change, or delete surrounding characters

call plug#end()

" ----- Default Configs -----
set number " Show line numbers
set ruler " Not sure what these ones do
set hls is " Not sure what these ones do
set nocompatible " Don't worry about compatibility with old vim
let mapleader = "\<space>" " Set leader to spacebar
set ignorecase " Searches are by default case insensitive
set smartcase " Searches with all lower-case are case insensitive, searches with and capitals are case-sensitive

" Set tab to 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

filetype plugin indent on " Automatically read filetype
set visualbell " No bells, apparently
set noerrorbells "Try to turn off error bells, might need more config

" Color schemes
syntax on
colorscheme jellybeans

set scrolloff=5 " Always show 5 lines below cursor, seems to be not working.

" Highlight lines over 90 characters
" Change the value below from 91 to adjust highlighting.
autocmd FileType ruby highlight OverLength ctermbg=red ctermfg=white guibg=#592929
autocmd FileType ruby match OverLength /\%91v.\+/

" Show invisible characters
" set list
" set listchars=tab:>-,trail:.

" Set backup and swp directory to not add files to project directories, but
" `.vim` instead
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

" Make CtrlP use ag for listing the files. Way faster and no useless files.
" Set default values in `.agignore`
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0

" Remove trailing whitespace in certain filetypes on save
au BufWritePre *.rb :%s/\s\+$//e
au BufWritePre *.go :%s/\s\+$//e
au BufWritePre *.js :%s/\s\+$//e

" Normal backspace in normal mode
set backspace=indent,eol,start

" ----- Language Specific Settings ----- 
" Go
" Set tabs to 4 space tabs
autocmd FileType go set tabstop=8|set shiftwidth=8|set noexpandtab

" Run goimports as well as gofmt on save
let g:go_fmt_command = "goimports"

" ----- Normal Mode Bindings -----
nmap j gj
nmap k gk
nmap 0 ^

" ----- Insert Mode Bindings ----- 
" Easy escape from insert mode
imap jk <esc>
imap kj <esc>

" ----- Visual Mode Bindings -----
" Use // to search for visual mode selection
vnoremap // y/<C-R>"<CR>

" ----- Leader Mode Bindings -----
nmap <leader>pr obinding.pry<esc> " Add binding.pry to the next line down

" RSpec-vim shortcuts
nmap <leader>s :call RunNearestSpec()<cr>
nmap <leader>a :call RunAllSpecs()<cr>
nmap <leader>f :call RunCurrentSpecFile()<cr>

" ----- Command Bindings -----
command! Q q
command! W w
command! Wq wq
command! WQ wq
command! Qw wq
command! QW wq

" ----- Navigation Shortcuts -----
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

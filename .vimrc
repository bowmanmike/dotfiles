" ----- Vim-plug -----
call plug#begin()

Plug 'jiangmiao/auto-pairs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'Yggdroot/indentLine'
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

call plug#end()

" ----- Default Configs -----
set number " Show line numbers
set ruler " Not sure what these ones do
set hls is " Not sure what these ones do

" Set tab to 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

filetype plugin indent on " Automatically read filetype
set noerrorbells "Try to turn off error bells, might need more config

" Color schemes
syntax on
colorscheme onedark

set scrolloff=5 " Always show 5 lines below cursor

" Highlight lines over 90 characters
" Change the value below from 91 to adjust highlighting.
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%91v.\+/

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

" ----- Insert Mode Bindings ----- 
" Easy escape from insert mode
imap jk <esc>
imap kj <esc>

" ----- Leader Mode Bindings -----
let mapleader = "\<space>"


" ----- Command Bindings -----
command! Q q
command! W w

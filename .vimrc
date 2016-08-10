execute pathogen#infect()

set number
set ruler
set hls is

filetype plugin indent on

" Set tab to 2 spaces
set tabstop=2
set shiftwidth=2

set expandtab

set noerrorbells

" Show invisible characters
" set list
" set listchars=tab:>-,trail:.

" Color schemes
syntax on
colorscheme Monokai

" Highlight lines over 90 characters
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%91v.\+/

" set alternative swp directory
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

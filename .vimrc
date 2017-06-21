" ----- Vim-plug -----
call plug#begin()

Plug 'airblade/vim-gitgutter' " Show git information in linenumbers
Plug 'cespare/vim-toml' " TOML syntax highlighting
Plug 'ctrlpvim/ctrlp.vim' " Fuzzy finder
Plug 'editorconfig/editorconfig-vim' " Allows .editorconfig files
Plug 'elixir-lang/vim-elixir' " Elixir syntax highlighting
Plug 'elzr/vim-json' " Better JSON support
Plug 'fatih/vim-go' " Go language support
Plug 'jiangmiao/auto-pairs' " Automatically fill in closing delimiters
Plug 'leafgarland/typescript-vim' " Typescript support
Plug 'mattn/emmet-vim' " Emmet for awesome HTML
Plug 'mileszs/ack.vim'  " Code search with AG
Plug 'mustache/vim-mustache-handlebars' " Mustache and Handlebars support
Plug 'ngmy/vim-rubocop' " Rubocop for vim
" Plug 'othree/html5.vim' " Enable this if more html tweaks needed
Plug 'othree/html5-syntax.vim' " HTML syntax improvement
Plug 'pangloss/vim-javascript' " Javascript language support
Plug 'posva/vim-vue' " Syntax highlighting for VueJS components
Plug 'slashmili/alchemist.vim' " Elixir utilities
Plug 'thoughtbot/vim-rspec' " Run RSpec tests from vim
Plug 'tpope/vim-commentary' " Easily comment and uncomment text
Plug 'tpope/vim-fugitive' " Sweet git integration
Plug 'tpope/vim-repeat' " Allow other plugins to hook into the . command
Plug 'tpope/vim-speeddating' " Quick modification of dates
Plug 'tpope/vim-surround' " Add, change, or delete surrounding characters
Plug 'Valloric/YouCompleteMe' " YouCompleteMe
Plug 'vim-airline/vim-airline' " Airline status bar
Plug 'vim-ruby/vim-ruby' " Ruby language support
Plug 'vim-scripts/SyntaxRange' " Syntax highlighting within range
Plug 'w0rp/ale' " Async linting, alternative to syntastic
" Plug 'vim-syntastic/syntastic' " Async linting

" Colorschemes
Plug 'nanotech/jellybeans.vim' " Jellybeans colorscheme
Plug 'vim-airline/vim-airline-themes' " Airline color schemes
" Plug 'fatih/molokai' " Vim Molokai
" Plug 'joshdick/onedark.vim' " Onedark colorscheme
" Plug 'romainl/Apprentice' " Apprentice colorscheme
" Plug 'sickill/vim-monokai' " Monokai color scheme
" Plug 'jpo/vim-railscasts-theme' " Railscasts colors

call plug#end()

" ----- Default Configs -----
set number " Show current line number
set ruler " Not sure what these ones do
set hls is " Not sure what these ones do
set nocompatible " Don't worry about compatibility with old vim
let mapleader = "\<space>" " Set leader to spacebar
set ignorecase " Searches are by default case insensitive
set smartcase " Searches with all lower-case are case insensitive, searches with and capitals are case-sensitive
set showcmd " show commands as they're typed
set clipboard=unnamed " Yank to system clipboard
set autoread " Automatically update vim buffer when file changes

" Set tab to 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=0
set smarttab

" Show whitespace
set list listchars=tab:»·,trail:·,nbsp:·

filetype plugin indent on " Automatically read filetype
set visualbell " No bells, apparently
set noerrorbells "Try to turn off error bells, might need more config

" Color schemes
syntax on
colorscheme jellybeans
" colorscheme molokai
" colorscheme onedark
" let g:molokai_original=1
" let g:rehash256=1


set scrolloff=5 " Always show 5 lines below cursor, seems to be not working.

" Highlight lines over 90 characters
" Change the value below from 91 to adjust highlighting.
autocmd FileType ruby highlight OverLength ctermbg=red ctermfg=white guibg=#592929
autocmd FileType ruby match OverLength /\%91v.\+/

" Show invisible characters
" set list
" set listchars=tab:>-,trail:.

" Don't use swap or backup directories
set nobackup
set nowritebackup
set noswapfile

" Set backup and swp directory to not add files to project directories, but
" `.vim` instead
" set backupdir=~/.vim/backup//
" set directory=~/.vim/swp//

" Make CtrlP use ag for listing the files. Way faster and no useless files.
" Set default values in `.agignore`
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](doc|tmp|node_modules|bower_components|vendor)',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

" Use AG instead of Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep -i'
endif

" Map leader-g to ack and don't automatically jump to results
cnoreabbrev Ack Ack!
nnoremap <Leader>g :Ack! --ignore vendor<Space>

" Remove trailing whitespace in certain filetypes on save
au BufWritePre *.rb :%s/\s\+$//e
au BufWritePre *.go :%s/\s\+$//e
au BufWritePre *.js :%s/\s\+$//e
au BufWritePre *.vue :%s/\s\+$//e
au BufWritePre *.html :%s/\s\+$//e
au BufWritePre *.css :%s/\s\+$//e
au BufWritePre *.scss :%s/\s\+$//e
au BufWritePre *.yaml :%s/\s\+$//e
au BufWritePre *.ex :%s/\s\+$//e
au BufWritePre *.exs :%s/\s\+$//e
au BufWritePre *.c :%s/\s\+$//e

" Normal backspace in normal mode
set backspace=indent,eol,start

" Airline Settings
" Always display airline status bar
set laststatus=2

" Better Tab Bar
let g:airline#extensions#tabline#enabled = 1

" ----- Language Specific Settings ----- 
" Go
" Set tabs to 4 space tabs
autocmd FileType go set tabstop=4|set shiftwidth=4|set noexpandtab

"JSON
"Set tabs to 4 spaces
autocmd FileType json set tabstop=2|set shiftwidth=2|set expandtab|set smarttab
let g:vim_json_syntax_conceal = 0

" YAML
" set tabs to 2 spaces
autocmd FileType yaml set tabstop=2|set shiftwidth=2|set expandtab|set smarttab

" Markdown
" 2 space tabs
" autocmd FileType md set tabstop=2|set shiftwidth=2|set expandtab|set smarttab

" HTML
" Remap emmet trigger to <C-Z>
let g:user_emmet_leader_key='<C-Z>'

" Run goimports as well as gofmt on save
let g:go_fmt_command = "goimports"

" Improve syntax highlighting for go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1 " Disable if things get slow
let g:go_highlight_structs = 1 " Disable if things get slow
let g:go_highlight_interfaces = 1 " Disable if things get slow
let g:go_highlight_build_constraints = 1

" ----- Syntastic -----
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 0
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_go_checkers=['gometalinter']
" let g:syntastic_javascript_checkers=['eslint']

" ----- Normal Mode Bindings -----
nmap j gj
nmap k gk
nmap 0 ^

" ----- Insert Mode Bindings ----- 
" Easy escape from insert mode
" imap jk <esc>
" imap kj <esc>

" ----- Leader Mode Bindings -----
nmap <leader>pr obinding.pry<esc> " Add binding.pry to the next line down

" RSpec-vim shortcuts
autocmd FileType ruby nmap <leader>s :call RunNearestSpec()<cr>
autocmd FileType ruby nmap <leader>a :call RunAllSpecs()<cr>
autocmd FileType ruby nmap <leader>f :call RunCurrentSpecFile()<cr>

" GoVim Shortcuts
au FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)
au FileType go nmap <Leader>e <Plug>(go-rename)
autocmd FileType go nmap <Leader>t <Plug>(go-test)
autocmd FileType go nmap <Leader>dc :GoDoc<cr>
autocmd FileType go nmap <Leader>c :GoCoverage<cr>
autocmd FileType go nmap <Leader>cl :GoCoverageClear<cr>
" autocmd FileType go nmap <Leader>df :GoDef<cr> " => Unnecessary, `gd` does this already

" ----- JSON Modification -----
" Use JQ to pretty print or compact json
function! PrettyPrintJSON()
  :%!jq '.' -M
endfunction

function! MinifyJSON()
  :%!jq '.' -cM
endfunction

autocmd FileType json nmap <leader>pj :call PrettyPrintJSON()<cr>
autocmd FileType json nmap <leader>mj :call MinifyJSON()<cr>

" ALE linter settings
autocmd FileType go let g:ale_enabled = 0
" Choose specific linters for each language
" let g:ale_linters = {
"       \}

" Lint only on save, rather than after every keystroke
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 1

" ----- Command Bindings -----
command! Q q
command! W w
command! Wq wq
command! WQ wq
command! Qw wq
command! QW wq
command! SO source $MYVIMRC

" ----- Navigation Shortcuts -----
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

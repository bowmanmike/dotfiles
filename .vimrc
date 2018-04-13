" ----- Vim-plug -----
call plug#begin()

" Utilities
Plug 'airblade/vim-gitgutter' " Show git information in linenumbers
" Plug 'ctrlpvim/ctrlp.vim' " Fuzzy finder
Plug 'editorconfig/editorconfig-vim' " Allows .editorconfig files
Plug 'jiangmiao/auto-pairs' " Automatically fill in closing delimiters
if has('macunix')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim' " FZF in vim instead of ctrl-p
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
endif
Plug 'mattn/emmet-vim' " Emmet for awesome HTML
Plug 'mileszs/ack.vim'  " Code search with AG
Plug 'mustache/vim-mustache-handlebars' " Mustache and Handlebars support
Plug 'ngmy/vim-rubocop' " Rubocop for vim
Plug 'tpope/vim-commentary' " Easily comment and uncomment text
Plug 'tpope/vim-fugitive' " Sweet git integration
Plug 'tpope/vim-repeat' " Allow other plugins to hook into the . command
Plug 'tpope/vim-speeddating' " Quick modification of dates
Plug 'tpope/vim-surround' " Add, change, or delete surrounding characters
Plug 'vim-airline/vim-airline' " Airline status bar
Plug 'vim-scripts/SyntaxRange' " Syntax highlighting within range
Plug 'w0rp/ale' " Async linting, alternative to syntastic

" Language Plugins
Plug 'slashmili/alchemist.vim' " Elixir utilities
Plug 'elixir-lang/vim-elixir' " Elixir syntax highlighting
Plug 'mhinz/vim-mix-format' " Code formatting for Elixir
Plug 'fatih/vim-go' " Go language support
Plug 'junegunn/goyo.vim' " Writing prose in vim
" Plug 'othree/html5.vim' " Enable this if more html tweaks needed
Plug 'othree/html5-syntax.vim' " HTML syntax improvement
Plug 'pangloss/vim-javascript' " Javascript language support
Plug 'mxw/vim-jsx' " JSX highlighting
Plug 'elzr/vim-json' " Better JSON support
Plug 'thoughtbot/vim-rspec' " Run RSpec tests from vim
Plug 'vim-ruby/vim-ruby' " Ruby language support
Plug 'cespare/vim-toml' " TOML syntax highlighting
Plug 'leafgarland/typescript-vim' " Typescript support
Plug 'posva/vim-vue' " Syntax highlighting for VueJS components
Plug 'jceb/vim-orgmode'
Plug 'elmcast/elm-vim'
Plug 'tpope/vim-rails'
" Plug 'python-mode/python-mode'

" Colorschemes
Plug 'nanotech/jellybeans.vim' " Jellybeans colorscheme
Plug 'vim-airline/vim-airline-themes' " Airline color schemes
" Plug 'fatih/molokai' " Vim Molokai
" Plug 'joshdick/onedark.vim' " Onedark colorscheme
" Plug 'romainl/Apprentice' " Apprentice colorscheme
" Plug 'sickill/vim-monokai' " Monokai color scheme
" Plug 'jpo/vim-railscasts-theme' " Railscasts colors

" Experimental
Plug 'sebdah/vim-delve'
let g:delve_backend = "native"

" Neovim specific plugins
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " replacement for YouCompleteMe
  Plug 'zchee/deoplete-go' " Deoplete implementaiton for go
  Plug 'fishbullet/deoplete-ruby' " Deoplete implementaton for ruby
  " Plug 'Shougo/deoplete-rct' " Deoplete implementaton for ruby **DEPRECATED**
  Plug 'uplus/deoplete-solargraph' " Deoplete for ruby
  Plug 'mhartington/nvim-typescript' " Typescript support with deoplete
  Plug 'carlitux/deoplete-ternjs' " Deoplete for javascript
  Plug 'eagletmt/neco-ghc' " Deoplete for haskell
  Plug 'pbogut/deoplete-elm' " Deoplete for elm
  Plug 'zchee/deoplete-jedi' " Deoplete for python
  Plug 'Shougo/neosnippet' | Plug 'Shougo/neosnippet-snippets'
  Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh'} " Language server integration
  imap <C-k> <Plug>(neosnippet_expand_or_jump)
  smap <C-k> <Plug>(neosnippet_expand_or_jump)
  xmap <C-k> <Plug>(neosnippet_expand_target)
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#auto_complete_start_length=1
  let g:deoplete#sources#go#sort_class = ['package', 'func', 'var', 'type', 'const']
  let g:neosnippet#enable_completed_snippet = 1
  let g:neosnippet#scope_aliases = {}
  let g:neosnippet#scope_aliases['css'] = 'vue'
  let g:neosnippet#scope_aliases['html'] = 'vue,gohtml'
  let g:neosnippet#scope_aliases['javascript'] = 'vue'
  let g:deoplete#sources#ternjs#filetypes = ['javascript', 'jsx', 'javascript.jsx', 'vue']
  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
else
  Plug 'Valloric/YouCompleteMe' " YouCompleteMe
endif

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
set shortmess+=c " Fix for YCM bug -> https://github.com/Valloric/YouCompleteMe/issues/1562
set completeopt-=preview
set splitright " Open vertical splits to the right by default
set splitbelow " Open horizontal splits below by default
set mouse=a " Enable mouse for all modes
set cursorline " Highlight line cursor is on

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

" Don't use swap or backup directories
set nobackup
set nowritebackup
set noswapfile

" FZF Settings
nnoremap <silent> <C-p> :Files<cr>
nnoremap <silent> <C-b> :Buffers<cr>

" Quickfix improvements
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" Use RG instead of Ack
if executable('rg')
  let g:ackprg = 'rg --vimgrep -i'
endif

" Map leader-g to ack and don't automatically jump to results
cnoreabbrev Ack Ack!
nnoremap <Leader>g :Ack! <Space>

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
au BufWritePre *.json :%s/\s\+$//e

" Normal backspace in normal mode
set backspace=indent,eol,start

" Airline Settings
" Always display airline status bar
set laststatus=2

" Better Tab Bar
let g:airline#extensions#tabline#enabled = 1

" ----- Language Specific Settings ----- 
" --- Go ---
" Set tabs to 4 space tabs
autocmd FileType go set tabstop=4|set shiftwidth=4|set noexpandtab

" Run goimports as well as gofmt on save
let g:go_fmt_command = "goimports"

" Improve syntax highlighting for go
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
" let g:go_highlight_operators = 1 " Disable if things get slow
" let g:go_highlight_structs = 1 " Disable if things get slow
" let g:go_highlight_interfaces = 1 " Disable if things get slow
let g:go_highlight_build_constraints = 1

" Highlight identifier under cursor
let g:go_auto_sameids = 1
" Show type info on hover
" Don't need because <leader> i does the same thing
" let g:go_auto_type_info = 1

" Only use quickfix
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

" --- Python ---
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab

" --- Elixir ---
if has('nvim')
  autocmd FileType elixir nnoremap <leader>ti :IEx<cr>
endif
let g:mix_format_on_save = 1

" --- Elm ---
autocmd FileType elm let g:elm_format_autosave = 1
autocmd FileType elm let g:elm_format_fail_silently = 1

" --- JSON ---
"Set tabs to 4 spaces
autocmd FileType json set tabstop=2|set shiftwidth=2|set expandtab|set smarttab
let g:vim_json_syntax_conceal = 0
" Use JQ to pretty print or compact json
function! PrettyPrintJSON()
  :%!jq '.' -M
endfunction

function! MinifyJSON()
  :%!jq '.' -cM
endfunction

autocmd FileType json nmap <leader>pj :call PrettyPrintJSON()<cr>
autocmd FileType json nmap <leader>mj :call MinifyJSON()<cr>

" --- YAML ---
" set tabs to 2 spaces
autocmd FileType yaml set tabstop=2|set shiftwidth=2|set expandtab|set smarttab

" --- Markdown ---
" 2 space tabs
autocmd FileType md set tabstop=2|set shiftwidth=2|set expandtab|set smarttab

" --- HTML ---
" Remap emmet trigger to <C-Z>
let g:user_emmet_leader_key='<C-Z>'
let g:user_emmet_settings = {
        \'javascript.jsx': {
          \'extends': 'jsx',
          \'quote_char': "'",
          \},
      \}

" --- Javascript ---
let g:jsx_ext_required = 0

" --- Go Templates ---
autocmd FileType gohtmltmpl set tabstop=2|set shiftwidth=2|set expandtab|set smarttab

" --- Ruby ---
nmap <leader>pr obinding.pry<esc> " Add binding.pry to the next line down
autocmd FileType ruby nmap <leader>s :call RunNearestSpec()<cr>
autocmd FileType ruby nmap <leader>a :call RunAllSpecs()<cr>
autocmd FileType ruby nmap <leader>f :call RunCurrentSpecFile()<cr>

" RSPEC
let g:rspec_command = '!bundle exec rspec {spec}'

" ----- Normal Mode Bindings -----
nmap j gj
nmap k gk
nmap 0 ^
nmap <leader>z :tabnew %<cr>

" Fugitive Shortcuts
nmap <Leader>gs :Gstatus<cr>
nmap <Leader>gd :Gdiff<cr>
nmap <Leader>gb :Gblame<cr>

" Neovim Terminal Shortcuts
" Enable if using nvim
if has('nvim')
  " Open terminal in new tab
  nmap <leader>tt :tabnew term://bash<cr>i
  " Open terminal in vsplit
  nmap <leader>tv :vsplit term://bash<cr>i
  " Open terminal in hsplit
  nmap <leader>th :split term://bash<cr>i
  " Map esc to exit terminal input mode
  tnoremap <Esc> <C-\><C-N>
endif

" ----- Prose Mode ------
function! ProseMode()
  call goyo#execute(0, [])
  set spell noci nosi noai nolist noshowmode noshowcmd
  set complete+=s
endfunction

command! ProseMode call ProseMode()
nmap \p :ProseMode<cr>

" ALE linter settings
autocmd FileType vue let g:ale_enabled = 0

" Set rubocop command
let g:ale_ruby_rubocop_executable = 'bundle'

" Leave gutter open all the time
let g:ale_sign_column_always = 1

" Choose specific linters for each language
let g:ale_linters = {}
let g:ale_linters['go'] = ['golint', 'go vet', 'go build']
let g:ale_linters['scss'] = ['scsslint']
let g:ale_linters['css'] = ['scsslint']
" let g:ale_linters['vue'] = ['eslint']

" Automatic fixers for specific languages
let g:ale_fixers = {}
let g:ale_fixers['typescript'] = ['prettier']
let g:ale_fixers['scss'] = ['prettier']
let g:ale_fixers['css'] = ['prettier']
" let g:ale_fixers['html'] = ['tidy']

" Vue filetype aliases
" let g:ale_linter_aliases = {'vue': 'javascript'}

" autocmd FileType javascript let g:ale_fix_on_save = 0
" autocmd FileType scss let g:ale_fix_on_save = 0
" autocmd FileType css let g:ale_fix_on_save = 0
autocmd FileType javascript let g:ale_javascript_prettier_options = '--single-quote --trailing-comma'

" Disable for vendor, node_modules
let g:ale_pattern_options = {
      \  '.*/vendor/*.go': {
      \    'ale_enabled': 0
      \  },
      \  '.*/node_modules/*.js': {
      \    'ale_enabled': 0
      \  }
      \}

" Lint only on save, rather than after every keystroke
" let g:ale_lint_on_text_changed = 'never'  => Keep in since it was
" gometalinter that was slowing things down
let g:ale_lint_on_enter = 1
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

" ----- GitGutter Settings -----
set updatetime=100

" Update edited files in real-ish time
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
autocmd FileChangedShellPost *
      \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

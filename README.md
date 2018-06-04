Dotfiles for gitconfig, bash_profile, atom config folder

#### Symlinks
- `.vimrc.`
- `.bash_profile`
- `.gitconfig`
- `.tmux.conf`
- `.agignore`
- `gitignore` -> `/dotfiles/.gitignore_global`
- `.vim` -> Vim directory
- `init.vim` -> `~/.config/nvim/init.vim`

#### Things to Install
*Homebrew*
- `the_silver_searcher`
- `jq` -> JSON pretty printer
- `hub`
- `git`
- `rbenv`
- `bash-completion`
- `tmux`
- `go`
- `grip` -> Markdown previewer
- `python`
- `n ` -> node version manager
- `ruby-build`
- `tree`
- `wget`

*Cask*
- `atom`
- `vscode`
- `iterm2`

#### Set up new machine
`cd ~/.vim`
Open vim,run `:PlugInstall`

#### Notes
##### Terminal
- Download iTerm2, download Meslo font from Dropbox, set font size to 14
- Set to open ssh links
- Setup to send ^b and ^f properly
- Install `reattach-to-user-namespace` for tmux to work

##### YouCompleteMe
Need to compile the python portion of the plugin. Need to have a version of python compiled with the following env var set:
  `PYTHON_CONFIGURE_OPTS="--enable-framewor"`
Then `cd` to the `YouCompleteMe` directory (`~/dotfiles/.vim/plugged/YouCompleteMe`) and run
  `./install.py --gocode-completer --clang-completer --tern-completer --racer-completer`

##### Neovim
- Need to link init.vim for nvim into `.config/nvim/init.vim`
- Need to source `~/.bash_profile` in `~/.bashrc` in ordre for neovim terminal to use bash profile
- Install neovim modules for ruby, node, python 2 and 3

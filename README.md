Dotfiles for gitconfig, bash_profile, atom config folder

#### Symlinks
- `.vimrc.`
- `.bash_profile`
- `.gitconfig`
- `.tmux.conf`
- `.agignore`
- `gitignore` -> `/dotfiles/.gitignore_global`
- `.vim` -> Vim directory
- `.atom`

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

*Other*
- `docker`
- `atom`

#### Set up new machine
`cd ~/.vim`
Open vim,run `:PlugInstall`

#### Notes
##### YouCompleteMe
Need to compile the python portion of the plugin. Need to have a version of python compiled with the following env var set:
  `PYTHON_CONFIGURE_OPTS="--enable-framewor"`
Then `cd` to the `YouCompleteMe` directory (`~/dotfiles/.vim/plugged/YouCompleteMe`) and run
  `./install.py --gocode-completer --clang-completer --tern-completer --racer-completer`

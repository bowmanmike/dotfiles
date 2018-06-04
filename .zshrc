# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/mikebowman/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  aws
  brew
  git
  github
  httpie
  jira
  pip
  python
  rails
  ruby
  taskwarrior
  thefuck
  tmux
  yarn
  z
)

source $ZSH/oh-my-zsh.sh
fpath=(/usr/local/share/zsh-completions $fpath)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Initialize rbenv => more at bottom
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH=/usr/local/bin:$PATH

export PATH=/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH
export EDITOR='nvim'

# Configure nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# nvm tab completion
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

# Configure golang
export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# Unset $PAGER
export PAGER="less"

# Add score deploy key
[[ -f ~/dotfiles/.thescore_deploy_key ]] && source ~/dotfiles/.thescore_deploy_key

# Add Rust to path
export PATH=$PATH:$HOME/.cargo/bin

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi
alias vimr='vimr -n'
alias fvr='vimr -n $(fzf)'
alias vimr="vimr -n"
alias ll="ls -lahG"
alias cl="clear"
alias tns='tmux new -s'
alias tat='tmux attach -t'
alias tls='tmux ls'
alias git='hub'
alias ag='ag --skip-vcs-ignores --path-to-ignore ~/.ignore'
alias rg='rg -i'
alias weather='curl -4 wttr.in/Toronto'
alias mux='tmuxinator'
alias fv='vim $(fzf)'
alias be='bundle exec'
alias als='alias | rg'

# Better git shortcuts
alias glog="git log --oneline --decorate --graph -15"
alias gcos="git checkout staging"

# theScore Aliases
alias finv='./run filter-inventory'

# FZF config
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Direnv
eval "$(direnv hook zsh)"

# Rbenv
eval "$(rbenv init -)"

# ASDF
# . /usr/local/opt/asdf/asdf.sh
# . /usr/local/etc/bash_completion.d/asdf.bash

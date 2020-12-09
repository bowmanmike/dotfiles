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
  # asdf
  # aws
  brew
  git
  github
  # httpie
  # jira
  # pip
  # python
  rails
  ruby
  taskwarrior
  # thefuck
  # tmux
  # yarn
  z
)

source $ZSH/oh-my-zsh.sh
fpath=(/usr/local/share/zsh-completions $fpath)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export PATH=/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH
export EDITOR='nvim --noplugin'

# Configure golang
export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# Unset $PAGER
export PAGER="less -F -X"

# Add score deploy key
[[ -f ~/dotfiles/.thescore_deploy_key ]] && source ~/dotfiles/.thescore_deploy_key
[[ -f ~/dotfiles/.digital_ocean_token ]] && source ~/dotfiles/.digital_ocean_token

# Add Rust to path
export PATH=$HOME/.cargo/bin:$PATH

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"

# Android emulator settings
export ANDROID_SDK_ROOT="/usr/local/share/android-sdk"
export PATH=$PATH:${ANDROID_SDK_ROOT}/emulator
export PATH=$PATH:${ANDROID_SDK_ROOT}/tools
export PATH=$PATH:${ANDROID_SDK_ROOT}/platform-tools

# Set GPG stuff
export GPG_TTY=$(tty)

# Preserve iex history across sessions
export ERL_AFLAGS="-kernel shell_history enabled"

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
# alias tns='tmux -CC new -A -s'
# alias tat='tmux -CC attach -t'
alias tls='tmux ls'
alias git='hub'
alias ag='ag --skip-vcs-ignores --path-to-ignore ~/.ignore'
alias rg='rg -i'
alias weather='curl -4 wttr.in/Toronto'
alias mux='tmuxinator'
alias fv='vim -O $(fzf -m --preview "bat --theme='1337' --style='numbers,changes' --color always {}")'
alias be='bundle exec'
alias als='alias | rg'
alias t='task'
# alias t='todo.sh'
alias k='kubectl'
alias cat='bat'
alias kc='kubectx'
alias kns='kubens'
alias repry='fc -e - mix\ test=iex\ -S\ mix\ test\ --trace mix\ test'
alias mt="mix test"
alias mtt="mix test --trace"
alias ml="mix lint"
alias mf="mix format"
alias mc="mix compile"
alias tf="mix test `pbpaste`"
alias mflt="mix format && mix lint && mix test"
alias mps="iex -S mix phx.server"
alias mil='mix identity_login mike.bowman+2@thescore.com 12345678b! | sed -n '\''6p'\'' | jq '\''.["Authorization"] | split(" ")[1]'\'''

# Better git shortcuts
alias glog="git log --oneline --decorate --graph -15"
alias gcos="git checkout staging"
alias gstt="git status -s | cut -d' ' -f3 | rg --color never spec"

# theScore Aliases
alias finv='./run filter-inventory'
alias ars='cd thescore-api && rs'
alias arc='cd thescore-api && rc'

alias dc='docker-compose'

# FZF config
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

function fco {
  local filter
  if ! which fzf > /dev/null 2>&1; then
    echo "FZF not installed!"
    return 1
  fi

  branch=`git branch --list | fzf --height=7 --min-height=5 --reverse --query="$1" --select-1 | sed -e 's/^[[:space:]\*]*//'`

  [[ -n "$branch" ]] && git checkout "$branch"
}

# Gcloud
# source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
# source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

# Direnv
eval "$(direnv hook zsh)"

# ASDF
# export ASDF_DATA_DIR=$HOME/Projects/asdf
. /usr/local/opt/asdf/asdf.sh
. /usr/local/opt/asdf/etc/bash_completion.d

# ZSH Autocomplete
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

fpath+=${ZDOTDIR:-~}/.zsh_functions

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/mikebowman/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

# The next line updates PATH for Netlify's Git Credential Helper.
if [ -f '/Users/mikebowman/.netlify/helper/path.zsh.inc' ]; then source '/Users/mikebowman/.netlify/helper/path.zsh.inc'; fi

# # Vi mode
# # bindkey -v
# export KEYTIMEOUT=1

# # Use vim keys in tab complete menu:
# bindkey -M menuselect 'h' vi-backward-char
# bindkey -M menuselect 'k' vi-up-line-or-history
# bindkey -M menuselect 'l' vi-forward-char
# bindkey -M menuselect 'j' vi-down-line-or-history
# bindkey -v '^?' backward-delete-char

# # Change cursor shape for different vi modes.
# function zle-keymap-select {
#   if [[ ${KEYMAP} == vicmd ]] ||
#      [[ $1 = 'block' ]]; then
#     echo -ne '\e[1 q'
#   elif [[ ${KEYMAP} == main ]] ||
#        [[ ${KEYMAP} == viins ]] ||
#        [[ ${KEYMAP} = '' ]] ||
#        [[ $1 = 'beam' ]]; then
#     echo -ne '\e[5 q'
#   fi
# }
# zle -N zle-keymap-select
# zle-line-init() {
#     zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
#     echo -ne "\e[5 q"
# }
# zle -N zle-line-init
# echo -ne '\e[5 q' # Use beam shape cursor on startup.
# preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# autoload edit-command-line; zle -N edit-command-line
# bindkey '^e' edit-command-line

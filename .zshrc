# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/mikebowman/.oh-my-zsh
# export SHELL=$(brew --prefix zsh)
export SHELL=/bin/zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Run these commands to install spaceship
# git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
# ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
# ZSH_THEME="spaceship"

# SPACESHIP_TIME_SHOW=true
# SPACESHIP_DIR_PREFIX=""
# SPACESHIP_KUBECTL_SHOW=true
# SPACESHIP_PROMPT_ORDER=(
#   time          # Time stamps section
#   user          # Username section
#   dir           # Current directory section
#   host          # Hostname section
#   git           # Git section (git_branch + git_status)
#   # hg            # Mercurial section (hg_branch  + hg_status)
#   # package       # Package version
#   # node          # Node.js section
#   # ruby          # Ruby section
#   # elixir        # Elixir section
#   # xcode         # Xcode section
#   # swift         # Swift section
#   # golang        # Go section
#   # php           # PHP section
#   # rust          # Rust section
#   # haskell       # Haskell Stack section
#   # julia         # Julia section
#   # docker        # Docker section
#   # aws           # Amazon Web Services section
#   # gcloud        # Google Cloud Platform section
#   # venv          # virtualenv section
#   # conda         # conda virtualenv section
#   # pyenv         # Pyenv section
#   # dotnet        # .NET section
#   # ember         # Ember.js section
#   kubectl       # Kubectl context section
#   # terraform     # Terraform workspace section
#   exec_time     # Execution time
#   line_sep      # Line break
#   battery       # Battery level and status
#   vi_mode       # Vi-mode indicator
#   jobs          # Background jobs indicator
#   exit_code     # Exit code section
#   char          # Prompt character
# )

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
  # fzf
  git
  github
  # httpie
  # jira
  # pip
  # python
  # rails
  # ruby
  # taskwarrior
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
export ELIXIR_EDITOR="code --goto __FILE__:__LINE__"

# Unset $PAGER
export PAGER="less -F -X"

# Add score deploy key
[[ -f ~/dotfiles/.thescore_deploy_key ]] && source ~/dotfiles/.thescore_deploy_key
[[ -f ~/dotfiles/.digital_ocean_token ]] && source ~/dotfiles/.digital_ocean_token

# Add Rust to path
export PATH=$HOME/.cargo/bin:$PATH

# Add lvim to path
export PATH=$PATH:$HOME/.local/bin

# ssh
# export SSH_KEY_PATH="~/.ssh/id_rsa"

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
alias fv='vim -O $(fzf -m --preview "bat --theme='OneHalfDark' --style='numbers,changes' --color always {}")'
# alias fl='lvim -O $(fzf -m --preview "bat --theme='1337' --style='numbers,changes' --color always {}")'
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

# Better git shortcuts
alias glog="git log --oneline --decorate --graph -15"
alias gcos="git checkout staging"
alias gstt="git status -s | cut -d' ' -f3 | rg --color never spec"

alias dc='docker-compose'

# FZF config
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/"'
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

# Direnv
eval "$(direnv hook zsh)"

# ASDF
. /opt/homebrew/opt/asdf/libexec/asdf.sh
# . ~/.asdf/plugins/golang/set-env.zsh

# ZSH Autocomplete
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

fpath+=${ZDOTDIR:-~}/.zsh_functions

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/mikebowman/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

# The next line updates PATH for Netlify's Git Credential Helper.
if [ -f '/Users/mikebowman/.netlify/helper/path.zsh.inc' ]; then source '/Users/mikebowman/.netlify/helper/path.zsh.inc'; fi

# Erlang install options
export KERL_CONFIGURE_OPTIONS="--without-javac --with-ssl=$(brew --prefix openssl@1.1)"

export ITERM2_SQUELCH_MARK=1
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# export PATH="$PATH:/Users/mikebowman/Library/Application Support/Coursier/bin"

# >>> JVM installed by coursier >>>
# export JAVA_HOME="/Users/mikebowman/Library/Caches/Coursier/arc/https/github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11%252B28/OpenJDK11-jdk_x64_mac_hotspot_11_28.tar.gz/jdk-11+28/Contents/Home"
# <<< JVM installed by coursier <<<

eval $(thefuck --alias)
# export ASDF_GOLANG_MOD_VERSION_ENABLED=true
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH=$PATH:$(go env GOPATH)/bin # <---- Confirm this line in you profile!!!

# add flutter
export PATH=$PATH:~/flutter/bin/

autoload zmv

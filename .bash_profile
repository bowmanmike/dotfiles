# Initialize rbenv => more at bottom
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

# Add Rust to path
export PATH=$PATH:$HOME/.cargo/bin

# Add Haskell to PATH
export PATH=$PATH:$HOME/.local/bin

# Aliases
alias ll="ls -ahlG"
alias be="bundle exec"
alias gitl="git log --oneline -15 --decorate --graph"
alias cl='clear'
alias tns='tmux new -s'
alias tat='tmux attach -t'
alias tls='tmux ls'
alias git='hub'
alias ag='ag --skip-vcs-ignores --path-to-ignore ~/.ignore'
alias rg='rg -i'
alias weather='curl -4 wttr.in/Toronto'
alias mux='tmuxinator'
alias fv='vim $(fzf)'
alias cj=count_json_file
alias cjd=count_json_directory
alias gp='go-pry run'
alias mjc=minify_json_from_clipboard
alias pjc=prettify_json_from_clipboard

# alias vim to nvim if nvim executable is present
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

# count objects in json file
function count_json_file() {
  cat $1 | jq '. | length'
}

function count_json_directory() {
  DIRECTORY="$1*.json"
  for i in $DIRECTORY
  do
    echo "$(count_json_file $i) -> $i"
  done
}

# minify and prettify json from clipboard
function minify_json_from_clipboard() {
  pbpaste | jq -cM '.' | pbcopy
}

function prettify_json_from_clipboard() {
  pbpaste | jq -M '.' | pbcopy
}

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# quality of life tweaks
# case-insensitive tab completion
bind "set completion-ignore-case on"

# tmuxinator completion
source ~/.tmuxinator/completion.bash

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

# Style command prompt
export PS1="\[\e[36m\]\t\[\e[m\]\[\e[36m\]-\[\e[m\]\[\e[36m\]\W\[\e[m\]\[\e[32m\]\`parse_git_branch\`\[\e[m\] "

# Git branch tab completion
if [[ $(uname -s) != Linux ]]
then
  if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
  fi
fi

# Autojump config
[ -f /usr/local/etc/profile.d/autojump.sh  ] && . /usr/local/etc/profile.d/autojump.sh

# FZF config
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
[ -f ~/.fzf.bash ] && source ~/.fzf.bash


eval $(thefuck --alias)
# alias thefuck to oops in case I don't feel like swearing
alias oops="fuck"
# Run rbenv init last. Was broken at top.
eval "$(rbenv init -)"
eval "$(pyenv init -)"
eval "$(direnv hook bash)"

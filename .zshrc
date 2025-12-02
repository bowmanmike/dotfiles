# Lean zshrc - no oh-my-zsh
# Backup of previous config: ~/.zshrc.backup-omz

#=============================================================================
# PERFORMANCE: Completion caching (skip rebuild if dump exists)
#=============================================================================
autoload -Uz compinit
# Always use -C (skip security check and use cache) if dump file exists
# Delete ~/.zcompdump to force a rebuild when needed
if [[ -f ~/.zcompdump ]]; then
  compinit -C
else
  compinit
fi

#=============================================================================
# EVALCACHE: Cache expensive eval commands
#=============================================================================
export ZSH_EVALCACHE_DIR="${ZSH_EVALCACHE_DIR:-$HOME/.zsh-evalcache}"

_evalcache() {
  local cmdHash="nohash" data="$*" name
  for name in $@; do
    [[ "${name}" = "${name#[A-Za-z_][A-Za-z0-9_]*=}" ]] && break
  done
  if typeset -f "${name}" > /dev/null; then
    data=${data}$(typeset -f "${name}")
  fi
  if builtin command -v md5 > /dev/null; then
    cmdHash=$(echo -n "${data}" | md5)
  elif builtin command -v md5sum > /dev/null; then
    cmdHash=$(echo -n "${data}" | md5sum | cut -d' ' -f1)
  fi
  local cacheFile="$ZSH_EVALCACHE_DIR/init-${name##*/}-${cmdHash}.sh"
  if [[ "$ZSH_EVALCACHE_DISABLE" = "true" ]]; then
    eval ${(q)@}
  elif [[ -s "$cacheFile" ]]; then
    source "$cacheFile"
  else
    if type "${name}" > /dev/null; then
      mkdir -p "$ZSH_EVALCACHE_DIR"
      eval ${(q)@} > "$cacheFile"
      source "$cacheFile"
    fi
  fi
}

_evalcache_clear() { rm -i "$ZSH_EVALCACHE_DIR"/init-*.sh 2>/dev/null; }

#=============================================================================
# ENVIRONMENT
#=============================================================================
export SHELL=/bin/zsh
export EDITOR='nvim'
export ELIXIR_EDITOR="code --goto __FILE__:__LINE__"
export PAGER="less -F -X"
export GPG_TTY=$(tty)
export ERL_AFLAGS="-kernel shell_history enabled"
export ITERM2_SQUELCH_MARK=1
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/"'

# Codespaces terminal fix
[[ -n $CODESPACES ]] && export TERM=xterm-256color

#=============================================================================
# PATH (consolidated, deduplicated)
#=============================================================================
typeset -U PATH  # Auto-remove duplicates

export PNPM_HOME="$HOME/Library/pnpm"
export BUN_INSTALL="$HOME/.bun"

path=(
  $HOME/.cargo/bin
  $HOME/.local/bin
  $HOME/.bun/bin
  $HOME/.lmstudio/bin
  $HOME/dotfiles/bin
  $HOME/flutter/bin
  $PNPM_HOME
  /Applications/Postgres.app/Contents/Versions/latest/bin
  $path
)

#=============================================================================
# COMPLETIONS
#=============================================================================
fpath=(/opt/homebrew/share/zsh/site-functions $HOME/.zsh/completions $fpath)
fpath+=${ZDOTDIR:-~}/.zsh_functions

#=============================================================================
# GIT HELPER FUNCTIONS (needed by aliases)
#=============================================================================
function git_current_branch() {
  local ref
  ref=$(git symbolic-ref --quiet HEAD 2>/dev/null)
  local ret=$?
  [[ $ret != 0 ]] && return
  echo ${ref#refs/heads/}
}

function git_main_branch() {
  command git rev-parse --git-dir &>/dev/null || return
  local ref
  for ref in refs/{heads,remotes/{origin,upstream}}/{main,trunk,mainline,default,stable,master}; do
    if command git show-ref -q --verify $ref; then
      echo ${ref:t}
      return 0
    fi
  done
  echo master
  return 1
}

function git_develop_branch() {
  command git rev-parse --git-dir &>/dev/null || return
  local branch
  for branch in dev devel develop development; do
    if command git show-ref -q --verify refs/heads/$branch; then
      echo $branch
      return 0
    fi
  done
  echo develop
  return 1
}

#=============================================================================
# GIT ALIASES (from oh-my-zsh git plugin)
#=============================================================================
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gapa='git add --patch'
alias gau='git add --update'
alias gav='git add --verbose'
alias gb='git branch'
alias gba='git branch --all'
alias gbd='git branch --delete'
alias gbD='git branch --delete --force'
alias gbl='git blame -w'
alias gbm='git branch --move'
alias gbnm='git branch --no-merged'
alias gbr='git branch --remote'
alias gbs='git bisect'
alias gbsb='git bisect bad'
alias gbsg='git bisect good'
alias gbsr='git bisect reset'
alias gbss='git bisect start'
alias gc='git commit --verbose'
alias gc!='git commit --verbose --amend'
alias gca='git commit --verbose --all'
alias gca!='git commit --verbose --all --amend'
alias gcam='git commit --all --message'
alias gcan!='git commit --verbose --all --no-edit --amend'
alias gcann!='git commit --verbose --all --date=now --no-edit --amend'
alias gcb='git checkout -b'
alias gcB='git checkout -B'
alias gcd='git checkout $(git_develop_branch)'
alias gcf='git config --list'
alias gcl='git clone --recurse-submodules'
alias gclean='git clean --interactive -d'
alias gcm='git checkout $(git_main_branch)'
alias gcmsg='git commit --message'
alias gcn!='git commit --verbose --no-edit --amend'
alias gco='git checkout'
alias gcor='git checkout --recurse-submodules'
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias gcs='git commit --gpg-sign'
alias gcsm='git commit --signoff --message'
alias gd='git diff'
alias gdca='git diff --cached'
alias gds='git diff --staged'
alias gdw='git diff --word-diff'
alias gf='git fetch'
alias gfo='git fetch origin'
alias ggpull='git pull origin "$(git_current_branch)"'
alias ggpush='git push origin "$(git_current_branch)"'
alias ggsup='git branch --set-upstream-to=origin/$(git_current_branch)'
alias ghh='git help'
alias gl='git pull'
alias glg='git log --stat'
alias glgg='git log --graph'
alias glgga='git log --graph --decorate --all'
alias glgm='git log --graph --max-count=10'
alias glgp='git log --stat --patch'
alias glo='git log --oneline --decorate'
alias glod='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset"'
alias glods='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset" --date=short'
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'
alias glol='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset"'
alias glola='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --all'
alias glols='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --stat'
alias gm='git merge'
alias gma='git merge --abort'
alias gmc='git merge --continue'
alias gmom='git merge origin/$(git_main_branch)'
alias gms='git merge --squash'
alias gmum='git merge upstream/$(git_main_branch)'
alias gp='git push'
alias gpd='git push --dry-run'
alias gpf='git push --force-with-lease --force-if-includes'
alias gpf!='git push --force'
alias gpoat='git push origin --all && git push origin --tags'
alias gpod='git push origin --delete'
alias gpr='git pull --rebase'
alias gpra='git pull --rebase --autostash'
alias gprav='git pull --rebase --autostash -v'
alias gprv='git pull --rebase -v'
alias gpsup='git push --set-upstream origin $(git_current_branch)'
alias gpu='git push upstream'
alias gpv='git push --verbose'
alias gr='git remote'
alias gra='git remote add'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase --interactive'
alias grbd='git rebase $(git_develop_branch)'
alias grbm='git rebase $(git_main_branch)'
alias grbo='git rebase --onto'
alias grbom='git rebase origin/$(git_main_branch)'
alias grbs='git rebase --skip'
alias grbum='git rebase upstream/$(git_main_branch)'
alias grev='git revert'
alias greva='git revert --abort'
alias grevc='git revert --continue'
alias grf='git reflog'
alias grh='git reset'
alias grhh='git reset --hard'
alias grhs='git reset --soft'
alias grm='git rm'
alias grmc='git rm --cached'
alias grmv='git remote rename'
alias groh='git reset origin/$(git_current_branch) --hard'
alias grrm='git remote remove'
alias grs='git restore'
alias grset='git remote set-url'
alias grss='git restore --source'
alias grst='git restore --staged'
alias grt='cd "$(git rev-parse --show-toplevel || echo .)"'
alias gru='git reset --'
alias grup='git remote update'
alias grv='git remote --verbose'
alias gsb='git status --short --branch'
alias gsh='git show'
alias gsi='git submodule init'
alias gss='git status --short'
alias gst='git status'
alias gsta='git stash push'
alias gstaa='git stash apply'
alias gstall='git stash --all'
alias gstc='git stash clear'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash show --patch'
alias gstu='git stash push --include-untracked'
alias gsu='git submodule update'
alias gsw='git switch'
alias gswc='git switch --create'
alias gswd='git switch $(git_develop_branch)'
alias gswm='git switch $(git_main_branch)'
alias gta='git tag --annotate'
alias gts='git tag --sign'
alias gtv='git tag | sort -V'
alias gwch='git log --patch --abbrev-commit --pretty=medium --raw'
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign --message "--wip-- [skip ci]"'
alias gwipe='git reset --hard && git clean --force -df'
alias gwt='git worktree'
alias gwta='git worktree add'
alias gwtls='git worktree list'
alias gwtmv='git worktree move'
alias gwtrm='git worktree remove'

#=============================================================================
# CUSTOM ALIASES (your overrides)
#=============================================================================
# Better git shortcuts (override some defaults)
alias glog="git log --oneline --decorate --graph -15"
alias gcos="git checkout staging"
alias gstt="git status -s | cut -d' ' -f3 | rg --color never spec"

# Editor
if command -v nvim &>/dev/null; then
  alias vim='nvim'
fi

# General
alias ll="ls -lahG"
alias cl="clear"
alias rg='rg -i'
alias be='bundle exec'
alias als='alias | rg'
if command -v bat &>/dev/null; then
  alias cat='bat'
fi

# Tmux
alias tns='tmux new -s'
alias tat='tmux attach -t'
alias tls='tmux ls'

# Docker & tools
alias dc='docker compose'
alias lg='lazygit'
alias rt='bin/rails test'

# Elixir/Phoenix
alias mflt="mix format && mix lint && mix test"
alias mps="iex -S mix phx.server"

#=============================================================================
# FUNCTIONS
#=============================================================================
# FZF git checkout
fco() {
  if ! command -v fzf &>/dev/null; then
    echo "FZF not installed!"
    return 1
  fi
  local branch
  branch=$(git branch --list | fzf --height=7 --min-height=5 --reverse --query="$1" --select-1 | sed -e 's/^[[:space:]\*]*//')
  [[ -n "$branch" ]] && git checkout "$branch"
}

# Create and cd to a temp directory
tempe() {
  cd "$(mktemp -d)"
  chmod -R 0700 .
  if [[ $# -eq 1 ]]; then
    \mkdir -p "$1"
    cd "$1"
    chmod -R 0700 .
  fi
}

# Make a directory and change into it
mkcd() {
  \mkdir -p "$1"
  cd "$1"
}

autoload zmv

#=============================================================================
# TOOL INITIALIZATION (using evalcache for speed)
#=============================================================================
# Mise (runtime version manager)
[[ -f ~/.local/bin/mise ]] && _evalcache ~/.local/bin/mise activate zsh

# Zoxide (fast directory jumping - replacement for z)
command -v zoxide &>/dev/null && _evalcache zoxide init zsh

# Starship prompt
command -v starship &>/dev/null && _evalcache starship init zsh

# FZF
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

# Zsh autosuggestions
[[ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && \
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

#=============================================================================
# SECRETS & TOKENS (fast file reading)
#=============================================================================
[[ -f ~/dotfiles/.digital_ocean_token ]] && source ~/dotfiles/.digital_ocean_token
[[ -f ~/.config/secrets/anthropic_api_key ]] && export ANTHROPIC_API_KEY=$(<~/.config/secrets/anthropic_api_key)
[[ -f ~/.config/secrets/gemini_api_key ]] && export GEMINI_API_KEY=$(<~/.config/secrets/gemini_api_key)
[[ -f ~/.config/secrets/google_project_id ]] && export GOOGLE_CLOUD_PROJECT=$(<~/.config/secrets/google_project_id)
[[ -f ~/.config/secrets/openai_api_key ]] && export OPENAI_API_KEY=$(<~/.config/secrets/openai_api_key)

#=============================================================================
# OPTIONAL INTEGRATIONS (loaded if present)
#=============================================================================
# Deno
[[ -f "$HOME/.deno/env" ]] && . "$HOME/.deno/env"

# Heroku autocomplete
[[ -f "$HOME/Library/Caches/heroku/autocomplete/zsh_setup" ]] && source "$HOME/Library/Caches/heroku/autocomplete/zsh_setup"

# Bun completions
[[ -s "$HOME/.bun/_bun" ]] && source "$HOME/.bun/_bun"

# Opam (OCaml)
[[ -r "$HOME/.opam/opam-init/init.zsh" ]] && source "$HOME/.opam/opam-init/init.zsh" 2>/dev/null

# FZF Integration
command -v zsh &> /dev/null && source <(fzf --zsh)

# Ensure vim mode is disabled
bindkey -e

# Key bindings
bindkey "^[[3~" delete-char       # Delete
bindkey "^[[5~" up-line-or-history  # Page Up
bindkey "^[[6~" down-line-or-history  # Page Down
bindkey "^[[H" beginning-of-line  # Home
bindkey "^[[F" end-of-line        # End

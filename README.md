Dotfiles for gitconfig, bash_profile, atom config folder

**Brew List**

1. Install homebrew
	- `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"` 
2. `brew update && brew upgrade` 
3. `brew install git` 
4. `brew install rbenv` 
5. `brew install bash-completion` 
6. `brew install tmux`
7. Add symlinks for .vimrc, .bash_profile, .gitconfig

**Vim Plugin Config**
cd ~/.vim
git submodule init
git submodule add git://github.com/tpope/vim-fugitive.git bundle/vim-fugitive
git commit -m 'Added vim-fugitive'
git push

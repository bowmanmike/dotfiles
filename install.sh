#!/usr/bin/env bash

# bash strict mode
set -euo pipefail
IFS=$'\n\t'

# Detect OS
OS="unknown"
case "$(uname -s)" in
    Darwin*)    OS="macos";;
    Linux*)     OS="linux";;
    *)          echo "Unsupported OS: $(uname -s)"; exit 1
esac

TOOLS=(
    "zsh"
    "git"
    "curl"
    "ripgrep"
    "fd"
    "gh"
    # "bat"
    "fzf"
    "tmux"
    "starship"
    # "neovim"
    "zsh-autosuggestions"
    "mise"
    "tpm" # tmux plugin manager
)

# Install package managers if needed
install_package_managers() {
    if [[ $OS == "macos" ]]; then
        if ! command -v brew &> /dev/null; then
            echo "Installing Homebrew..."
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        fi
    elif [[ $OS == "linux" ]]; then
        if command -v apt-get &> /dev/null; then
            export DEBIAN_FRONTEND=noninteractive
            # sudo -E add-apt-repository ppa:neovim-ppa/stable
            sudo -E apt-get update
            sudo -E apt-get install -y curl wget
        fi
    fi
}

# Install required tools
install_tools() {
    echo "Installing required tools..."
    if [[ $OS == "macos" ]]; then
        for tool in "${TOOLS[@]}"; do
            if ! command -v "$tool" &> /dev/null; then
                echo "Installing $tool..."
                case $tool in
                    "tpm")
                        if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
                            git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
                        fi
                        ;;
                    *) brew install "$tool"
                esac
            fi
        done
    elif [[ $OS == "linux" ]]; then
        # Install GitHub CLI repository
        if ! command -v gh &> /dev/null; then
            curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo -E dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
            echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo -E tee /etc/apt/sources.list.d/github-cli.list > /dev/null
        fi

        export DEBIAN_FRONTEND=noninteractive
        sudo -E apt-get update
        for tool in "${TOOLS[@]}"; do
            if ! command -v "$tool" &> /dev/null; then
                echo "Installing $tool..."
                case $tool in
                    # "ripgrep") sudo -E apt-get install -y ripgrep;;
                    "fd") sudo -E apt-get install -y fd-find; sudo -E ln -s /usr/bin/fdfind /usr/bin/fd;;
                    # "bat") sudo -E apt-get install -y bat; mkdir -p ~/.local/bin; ln -s /usr/bin/batcat ~/.local/bin/bat;;
                    # "gh") sudo -E apt-get install -y gh;; 
                    "starship") curl -sS https://starship.rs/install.sh | sh -s -- --yes;;  # Added --yes flag
                    "fzf")
                        if [[ ! -d "$HOME/.fzf" ]]; then
                            git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf; ~/.fzf/install --all
                        fi
                        ;;
                    "zsh-autosuggestions")
                        if [[ ! -d "$HOME/.zsh/zsh-autosuggestions" ]]; then
                            git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
                        fi
                        ;;
                    "mise") curl https://mise.run | sh;;
                    "tpm")
                        if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
                            git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
                        fi
                        ;;
                    *) sudo -E apt-get install -y "$tool";;
                esac
            else
                echo "$tool is already installed"
            fi
        done
    fi
}

install_neovim() {
    if ! command -v "nvim" &> /dev/null; then
        echo "Installing latest stable Neovim..."
        if [[ $OS == "macos" ]]; then
            brew install neovim
        elif [[ $OS == "linux" ]]; then
            echo "Building from source..."
            git clone https://github.com/neovim/neovim ~/neovim
            cd ~/neovim
            git checkout stable
            sudo -E apt-get update -y && sudo -E apt-get install -y ninja-build gettext cmake curl build-essential
            make CMAKE_BUILD_TYPE=RelWithDebInfo
            sudo -E make install
        fi
    else
        echo "Neovim is already installed"
    fi
}

# Create symlinks
create_symlinks() {
    echo "Creating symlinks..."
    local dotfiles_dir=$(pwd)
    if [ -n "$CODESPACES" ]; then
        local dotfiles_dir="/workspaces/.codespaces/.persistedshare/dotfiles"
    else
        local dotfiles_dir="$HOME/dotfiles"
    fi

    # Create config directory if it doesn't exist
    mkdir -p ~/.config

    # Array of files to symlink
    local SYMLINKS=(
    "$dotfiles_dir/.zshrc:$HOME/.zshrc"
    "$dotfiles_dir/.gitconfig:$HOME/.gitconfig"
    "$dotfiles_dir/.gitignore_global:$HOME/.gitignore"
    "$dotfiles_dir/nvim:$HOME/.config/nvim"
    "$dotfiles_dir/ghostty:$HOME/.config/ghostty"
    "$dotfiles_dir/.tmux.conf:$HOME/.tmux.conf"
    )

    for entry in "${SYMLINKS[@]}"; do
        IFS=":" read -r source dest <<< "$entry"
        if [ -e "$dest" ]; then
            echo "Backing up existing $dest to $dest.bak"
            mv "$dest" "$dest.bak"
        fi
        echo "Creating symlink: $source -> $dest"
        ln -sf "$source" "$dest"
    done
}

# Set up shell
setup_shell() {
    # Install oh-my-zsh if not already installed
    echo "Setting up shell..."
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        echo "Installing oh-my-zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    fi

    # Set zsh as default shell if it isn't already
    if [[ $OS == "macos" ]]; then
        if [[ $SHELL != "/bin/zsh" ]]; then
            echo "Setting zsh as default shell..."
            chsh -s /bin/zsh
        fi
    elif [[ $OS == "linux" ]]; then
        if [[ $SHELL != "/usr/bin/zsh" ]]; then
            echo "Setting zsh as default shell..."
            sudo -E chsh -s "$(which zsh)" "$(whoami)"
        fi
    fi
}

# Create a platform-specific zshrc
create_platform_zshrc() {
    local zshrc="$HOME/.zshrc"
    if [[ $OS == "linux" ]]; then
        # Add Linux-specific modifications
        echo "Adjusting .zshrc for Linux..."
        sed -i 's|/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh|$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh|g' "$zshrc"
        # Comment out Mac-specific paths and configurations
        sed -i 's|^export PATH=/Applications/Postgres.app/Contents/Versions/latest/bin:\$PATH|# export PATH=/Applications/Postgres.app/Contents/latest/bin:\$PATH|g' "$zshrc"
    fi
}

main() {
    echo "Starting dotfiles installation..."
    install_package_managers
    install_tools
    install_neovim
    create_symlinks
    setup_shell
    create_platform_zshrc
    echo "Installation complete! Please restart your shell."
}

main

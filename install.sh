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

# Required tools (removing neovim as we'll handle it separately)
TOOLS=(
    "zsh"
    "git"
    "curl"
    "ripgrep"
    "fd"
    "gh"
    "bat"
    "fzf"
    "tmux"
    "starship"
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
            sudo apt-get update
            sudo apt-get install -y curl
        fi
    fi
}

# Install latest stable Neovim
install_neovim() {
    echo "Installing latest stable Neovim..."
    if [[ $OS == "macos" ]]; then
        brew install neovim
    elif [[ $OS == "linux" ]]; then
        # Get the latest release version
        # local nvim_version=$(curl -s https://api.github.com/repos/neovim/neovim/releases/latest | grep -Po '"tag_name": "v\K[^"]*')
        # echo "Latest Neovim version: $nvim_version"
        sudo add-apt-repository ppa:neovim-ppa/stable
        sudo apt-get update
        sudo apt-get install neovim

        # Download and extract the appimage
        # curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
        # chmod u+x nvim.appimage

        # Move to a directory in PATH
        # sudo mkdir -p /usr/local/bin
        # sudo mv nvim.appimage /usr/local/bin/nvim

        # Create required directories
        # mkdir -p ~/.config/nvim
        # mkdir -p ~/.local/share/nvim
        # mkdir -p ~/.local/state/nvim
        # mkdir -p ~/.cache/nvim
    fi
}

# Install required tools
install_tools() {
    echo "Installing required tools..."
    if [[ $OS == "macos" ]]; then
        for tool in "${TOOLS[@]}"; do
            if ! command -v "$tool" &> /dev/null; then
                echo "Installing $tool..."
                brew install "$tool"
            fi
        done
    elif [[ $OS == "linux" ]]; then
        # Install GitHub CLI repository
        if ! command -v gh &> /dev/null; then
            curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
            echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
        fi

        sudo apt-get update
        for tool in "${TOOLS[@]}"; do
            if ! command -v "$tool" &> /dev/null; then
                echo "Installing $tool..."
                case $tool in
                    "ripgrep") sudo apt-get install -y ripgrep;;
                    "fd") sudo apt-get install -y fd-find;;
                    "bat") sudo apt-get install -y bat;;
                    "gh") sudo apt-get install -y gh;;
                    "starship") curl -sS https://starship.rs/install.sh | sh -s -- --yes;;  # Added --yes flag
                    *) sudo apt-get install -y "$tool";;
                esac
            fi
        done
    fi
}

# Create symlinks
create_symlinks() {
    echo "Creating symlinks..."
    local dotfiles_dir=$(pwd)

    # Create config directory if it doesn't exist
    mkdir -p ~/.config

    # Array of files to symlink
    declare -A SYMLINKS=(
        ["$dotfiles_dir/.zshrc"]="$HOME/.zshrc"
        ["$dotfiles_dir/.gitconfig"]="$HOME/.gitconfig"
        ["$dotfiles_dir/.gitignore_global"]="$HOME/.gitignore"
        ["$dotfiles_dir/nvim"]="$HOME/.config/nvim"
        ["$dotfiles_dir/ghostty"]="$HOME/.config/ghostty"
        ["$dotfiles_dir/.tmux.conf"]="$HOME/.tmux.conf"
    )

    for source in "${!SYMLINKS[@]}"; do
        local dest=${SYMLINKS[$source]}
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
            sudo chsh -s "$(which zsh)" "$(whoami)"
        fi
    fi
}

# Create a platform-specific zshrc
create_platform_zshrc() {
    local zshrc="$HOME/.zshrc"
    if [[ $OS == "linux" ]]; then
        # Add Linux-specific modifications
        echo "Adjusting .zshrc for Linux..."
        sed -i 's|/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh|/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh|g' "$zshrc"
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

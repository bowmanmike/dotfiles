# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal dotfiles repository containing configuration files for various development tools and shells. The repository is designed to work across macOS and Linux systems with automated setup and symlink management.

## Architecture

### Core Components

- **Automated Installation System** (`install.sh`): Cross-platform setup script that installs tools and creates symlinks
- **Neovim Configuration** (`nvim/`): Complete Lua-based Neovim setup with lazy.nvim plugin management
- **Shell Configuration** (`zsh`): ZSH configuration with oh-my-zsh integration
- **Terminal Configurations**: Ghostty, Kitty, and iTerm2 configurations
- **Editor Configurations**: Zed settings and keybindings
- **Development Tools**: Git, tmux, and various CLI utilities

### Directory Structure

- `nvim/` - Complete Neovim configuration with plugin ecosystem
  - `lua/plugins/` - Individual plugin configurations
  - `lua/vim-options.lua` - Core Neovim settings
  - `init.lua` - Entry point with lazy.nvim bootstrap
- `zed/` - Zed editor settings, themes, and snippets
- `ghostty/` - Ghostty terminal configuration
- `kitty/` - Kitty terminal configuration

## Common Commands

### Setup and Installation

```bash
# Initial setup (runs on macOS and Linux)
./install.sh

# Manual symlink creation (if needed)
# The install script handles this automatically
```

### Tool Management

The repository uses several package managers:
- **macOS**: Homebrew for most tools
- **Linux**: apt-get with manual installations for some tools
- **mise**: Runtime version management (configured in .zshrc)
- **lazy.nvim**: Neovim plugin management

### Neovim Plugin Management

```bash
# Plugins are managed automatically by lazy.nvim
# No manual commands needed - plugins sync on startup

# If manual sync needed:
nvim --headless "+Lazy! sync" +qa
```

## Development Environment

### Language Server Protocol (LSP)

The Neovim configuration (`nvim/lua/plugins/lsp-config.lua`) includes LSP setups for:
- TypeScript/JavaScript (ts_ls)
- Ruby (ruby_lsp, sorbet)
- Go (gopls)
- Rust (rust_analyzer)
- Lua (lua_ls)
- Tailwind CSS, ESLint, Astro, JSON, Emmet

Key LSP features:
- Mason for LSP installation management (mostly disabled in favor of system installs)
- Custom on_attach function with consistent keybindings
- Inlay hints support for TypeScript and Go
- Diagnostic configuration with custom signs

### Key Bindings (Neovim)

- `K` - LSP hover documentation
- `gd` - Go to definition
- `<leader>ca` - Code actions
- `<leader>rn` - Rename symbol
- `<leader>ih` - Toggle inlay hints

### Version Management

The setup uses `mise` for runtime version management. The .zshrc includes mise initialization, and Neovim's init.lua adds mise shims to the PATH.

## Platform Differences

The install.sh script handles platform-specific differences:
- **macOS**: Uses Homebrew for package installation
- **Linux**: Uses apt-get with special handling for tools like fzf, starship, and GitHub CLI
- **Codespaces**: Special handling for symlink paths and TERM environment variable

## Important Notes

- Ruby LSP: Uses system installation, not Mason (Mason version has known issues)
- Semantic highlighting is disabled in favor of Treesitter highlighting
- The configuration prioritizes performance (lazy loading, change detection disabled)
- Cross-platform compatibility is maintained through conditional logic in install.sh and .zshrc
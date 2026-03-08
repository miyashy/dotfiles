#!/bin/bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

link_file() {
  local src="$1"
  local dest="$2"

  if [[ -e "$dest" && ! -L "$dest" ]]; then
    mv "$dest" "${dest}.bak"
    echo "Backed up: $dest -> ${dest}.bak"
  fi

  ln -sf "$src" "$dest"
  echo "Linked: $src -> $dest"
}

link_file "$DOTFILES_DIR/Brewfile" ~/.Brewfile
link_file "$DOTFILES_DIR/.vimrc" ~/.vimrc
link_file "$DOTFILES_DIR/.zshrc" ~/.zshrc
link_file "$DOTFILES_DIR/.zshenv" ~/.zshenv
link_file "$DOTFILES_DIR/.p10k.zsh" ~/.p10k.zsh

# sheldon設定
mkdir -p "$HOME/.config/sheldon"
link_file "$DOTFILES_DIR/.config/sheldon/plugins.toml" "$HOME/.config/sheldon/plugins.toml"

# ghostty設定
mkdir -p "$HOME/.config/ghostty"
link_file "$DOTFILES_DIR/.config/ghostty/config" "$HOME/.config/ghostty/config"

# bin scripts
mkdir -p "$HOME/.local/bin"
link_file "$DOTFILES_DIR/bin/git-wt-cmux-hook" "$HOME/.local/bin/git-wt-cmux-hook"

# git-wt configuration
if command -v git-wt &>/dev/null; then
  if ! git config --global --get-all wt.hook 2>/dev/null | grep -qF "git-wt-cmux-hook"; then
    git config --global --add wt.hook "git-wt-cmux-hook"
    echo "Configured: wt.hook -> git-wt-cmux-hook"
  fi
  git config --global wt.nocd create
fi

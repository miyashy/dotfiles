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

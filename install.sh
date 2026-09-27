#!/bin/zsh
set -e
DOTFILES="$HOME/dotfiles"

brew bundle --file=

git -C "$DOTFILES" submodule update --init --recursive

brew bundle --file="$DOTFILES/Brewfile"

mkdir -p ~/.config

link() {
    local src="$1" dst="$2"
    rm -rf "$dst"
    ln -sfn "$src" "$dst"
}

# link zsh conf
link $DOTFILES/zsh/.zshrc ~/.zshrc

# nvim
link $DOTFILES/nvim ~/.config/nvim 

echo "done."

#!/bin/zsh
set -e
DOTFILES="$HOME/dotfiles"

git -C "$DOTFILES" submodule update --init --recursive

# link zsh conf
ln -sf $DOTFILES/zsh/.zshrc ~/.zshrc

echo "done."

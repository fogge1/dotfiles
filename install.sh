#!/bin/zsh
set -e
DOTFILES="$HOME/dotfiles"

git -C "$DOTFILES" submodule update --init --recursive

mkdir -p ~/.config

# link zsh conf
ln -sf $DOTFILES/zsh/.zshrc ~/.zshrc

# nvim
ln -sf $DOTFILES/nvim ~/.config/nvim 

# alacritty
mkdir -p "$HOME/.config/alacritty"
ln -sf "$DOTFILES/alacritty/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"

echo "done."

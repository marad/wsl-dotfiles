#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )


sudo pacman --noconfirm --needed -Syu neovim fzf rustup eza ripgrep bat starship

BASHRC="$SCRIPT_DIR/bashrc"

rm ~/.bashrc
ln -s $BASHRC ~/.bashrc

rm -rf ~/.config/nvim
ln -s "$SCRIPT_DIR/nvim" ~/.config/nvim

if ! type "cargo" > /dev/null; then
	rustup install stable
fi

if ! type "jumper" > /dev/null; then
	cargo install jumper
fi

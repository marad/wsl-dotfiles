#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )


sudo pacman --noconfirm -Syu ansible

ansible-playbook ansible/wsl.yaml

BASHRC="$SCRIPT_DIR/bashrc"

rm ~/.bashrc
ln -s $BASHRC ~/.bashrc

rm -rf ~/.config/nvim
ln -s "$SCRIPT_DIR/nvim" ~/.config/nvim

rm -rf ~/.config/starship.toml
ln -s "$SCRIPT_DIR/starship.toml" ~/.config/starship.toml


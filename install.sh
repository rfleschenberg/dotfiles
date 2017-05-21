#! /bin/bash

set -e

dotfiles="$(dirname $(readlink -f $0))"

mkdir ~/.config/nvim 2>/dev/null || true
ln -bnfs "$dotfiles/vimrc" ~/.config/nvim/init.vim

ln -bnfs "$dotfiles/zshrc" ~/.zshrc

ln -bnfs "$dotfiles/gitconfig" ~/.gitconfig

mkdir ~/.i3 2>/dev/null || true
ln -bnfs "$dotfiles/i3config" ~/.i3/config
ln -bnfs "$dotfiles/i3status.conf" ~/.i3status.conf

ln -bnfs "$dotfiles/pystartup" ~/.pystartup

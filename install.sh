#! /bin/bash

set -e

dotfiles="$(dirname $(readlink -f $0))"

mkdir -p ~/.config/nvim 2>/dev/null || true
ln -bnfs "$dotfiles/vimrc" ~/.config/nvim/init.vim
mkdir -p ~/.local/share/nvim/site/autoload/ 2>/dev/null || true
ln -bnfs "$dotfiles/plug.vim" ~/.local/share/nvim/site/autoload/plug.vim

ln -bnfs "$dotfiles/zshrc" ~/.zshrc

ln -bnfs "$dotfiles/gitconfig" ~/.gitconfig

mkdir ~/.i3 2>/dev/null || true
ln -bnfs "$dotfiles/i3config" ~/.i3/config
ln -bnfs "$dotfiles/i3status.conf" ~/.i3status.conf

ln -bnfs "$dotfiles/pystartup" ~/.pystartup

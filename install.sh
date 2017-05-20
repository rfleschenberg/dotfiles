#! /bin/bash

set -xe

dotfiles="$(dirname $(readlink -f $0))"

mkdir ~/.config/nvim || true
ln -bnfs $dotfiles/vimrc ~/.config/nvim/init.vim

ln -bnfs $dotfiles/zshrc ~/.zshrc

ln -bnfs $dotfiles/gitconfig ~/.gitconfig

mkdir ~/.i3 || true
ln -bnfs $dotfiles/i3config ~/.i3/config
ln -bnfs $dotfiles/i3status.conf ~/.i3status.conf

ln -bnfs $dotfiles/pystartup ~/.pystartup

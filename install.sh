#! /bin/bash

set -xe

dotfiles=$(dirname $(readlink -f $0))

mkdir ~/.config/nvim || true
ln -bnfs $dotfiles/vimrc ~/.config/nvim/init.vim

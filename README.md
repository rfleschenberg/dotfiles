# Installation (Debian Buster)

```
sudo apt install -y make build-essential libssl1.1 libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev git i3 direnv konsole keychain xclip neovim neovim-qt python-neovim python3-neovim zsh network-manager
chsh -s /bin/zsh
```

Now we install the dotfiles:
```
git clone git@github.com:rfleschenberg/dotfiles.git
cd dotfiles
git submodule update --init --recursive
./install.sh
source ~/dotfiles/zsh-dircolors-solarized/zsh-dircolors-solarized.zsh
setupsolarized dircolors.ansi-dark
```

Finally, clean up:
```
sudo apt-get autoremove
```

## nvim

https://github.com/rfleschenberg/kickstart.nvim?tab=readme-ov-file#installation

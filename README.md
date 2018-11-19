# Installation (Debian Stretch)

```
sudo apt install -y make build-essential libssl1.0.2 libssl1.1 libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev
sudo apt install -y git i3 direnv konsole keychain xclip
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
pyenv init
pyenv install 3.6.4
pyenv install 2.7.12
```

Next, install the Neovim Python bridge and other required packages:

```
~/.pyenv/versions/3.6.4/bin/pip3 install neovim jedi yapf
~/.pyenv/versions/2.7.12/bin/pip install neovim jedi yapf
```

Build and install Neovim:

```
cd /tmp
sudo apt-get install libtool libtool-bin autoconf automake cmake g++ pkg-config unzip
git clone git@github.com:neovim/neovim.git
cd neovim
make CMAKE_BUILD_TYPE=Release
sudo make install
```

Now we install the dotfiles:

```
git clone git@github.com:rfleschenberg/dotfiles.git
cd dotfiles
git submodule update --init --recursive
./install.sh
# ZSH only
source ~/dotfiles/zsh-dircolors-solarized/zsh-dircolors-solarized.zsh
setupsolarized dircolors.ansi-dark
```


Launch `nvim` and install the Neovim plugins:

```
:PlugInstall
```


Finally, clean up:

```
sudo apt-get autoremove
```

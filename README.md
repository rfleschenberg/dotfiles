# Installation (Debian Jessie)

We build a custom Python and installl it to `~/local`. Maybe it would be better
to use pyenv, but so far, this approach seems to work ok.

```
cd /tmp
sudo apt-get build-dep python
sudo apt-get install libreadline-dev
wget https://www.python.org/ftp/python/3.6.1/Python-3.6.1.tar.xz
tar -xvf Python-3.6.1.tar.xz
cd Python
./configure --prefix ~/local
make && make install
```

Note that when the path to this Python installation changes, we must update
these lines in `init.vim`:

```
let g:python_host_prog = '~/local/bin/python2'
let g:python3_host_prog = '~/local/bin/python3'
```

Next, install the Neovim Python bridge:

```
~/local/bin/pip3 install neovim
```

Build and install Neovim:

```
cd /tmp
sudo apt-get install libtool libtool-bin autoconf automake cmake g++ pkg-config unzip
git clone git@github.com:neovim/neovim.git
cd neovim
rm -rf build
make CMAKE_BUILD_TYPE=Release
sudo make install
```

Now we install the dotfiles:

```
./install.sh
```


Install our Neovim plugins:

```
:PlugInstall
```


Finally, clean up:

```
sudo apt-get autoremove
```

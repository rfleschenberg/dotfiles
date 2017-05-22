# Installation (Debian Jessie)

We build custom Pythons (both Python 2 and Python 3) and install them to
`~/local`. Maybe it would be better to use pyenv, but so far, this approach
seems to work ok.

```
sudo apt-get build-dep python
sudo apt-get install libreadline-dev
cd /tmp
wget https://www.python.org/ftp/python/2.7.13/Python-2.7.13.tar.xz
tar -xvf Python-2.7.13.tar.xz
cd Python-2.7.13
./configure --prefix ~/local
make && make install
wget https://bootstrap.pypa.io/get-pip.py
~/local/bin/python2 get-pip.py
cd /tmp
wget https://www.python.org/ftp/python/3.6.1/Python-3.6.1.tar.xz
tar -xvf Python-3.6.1.tar.xz
cd Python-3.6.1
./configure --prefix ~/local
make && make install
```

Note that when the paths to these Python installations change, we must update
these lines in `init.vim`:

```
let g:python_host_prog = '/home/rene/local/bin/python2'
let g:python3_host_prog = '/home/rene/local/bin/python3'
```

Next, install the Neovim Python bridge and other required packages:

```
~/local/bin/pip2 install neovim jedi yapf
~/local/bin/pip3 install neovim jedi yapf
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


Launch `nvim` and install the Neovim plugins:

```
:PlugInstall
```


Finally, clean up:

```
sudo apt-get autoremove
```

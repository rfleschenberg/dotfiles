# Installation (Debian Jessie)

## Neovim

```
cd /tmp
sudo apt-get install libtool libtool-bin autoconf automake cmake g++ pkg-config unzip
git clone git@github.com:neovim/neovim.git
cd neovim
rm -rf build
make CMAKE_BUILD_TYPE=Release
make
sudo make install
```

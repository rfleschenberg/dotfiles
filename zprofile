# vim: set syntax=zsh:

export HGENCODING="utf-8"
export EDITOR="nvim"
export PYTHONSTARTUP=~/.pystartup
export PYTHONDONTWRITEBYTECODE=1
export ANSIBLE_NOCOWS=1
unset LC_ALL
export LANG="de_DE.UTF-8"
export LC_MESSAGES="C"
if [ -f /usr/local/bin/nvim ]
then
    export EDITOR=/usr/local/bin/nvim
fi
export PATH=$PATH:/usr/sbin:/usr/local/sbin:/usr/local/heroku/bin
export PATH=$PATH:~/local/bin:~/.local/bin
export PATH=$PATH:~/.poetry/bin


if [[ -o interactive ]]
then
    keychain -q ~/.ssh/id_rsa
fi
if [ -e ~/.keychain/$HOST-sh ]
then
    . ~/.keychain/$HOST-sh
fi
if [ -e ~/.keychain/$HOST-gpg ]
then
    . ~/.keychain/$HOST-sh-gpg
fi


export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$HOME/.pyenv/shims:${PATH}"
if [ -e "$HOME/.pyenv" ]
then
    eval "$(pyenv init -)"
fi


export WORKON_HOME=~/.virtualenvs
export NVM_DIR="$HOME/.nvm"


source ~/dotfiles/zsh-dircolors-solarized/zsh-dircolors-solarized.zsh

export PATH="$HOME/.poetry/bin:$PATH"

export QT_IM_MODULE="xim"
export GTK_IM_MODULE="xim"

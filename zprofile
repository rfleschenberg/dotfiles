# vim: set syntax=zsh:

export HGENCODING="utf-8"
export PYTHONSTARTUP=~/.pystartup
export PYTHONDONTWRITEBYTECODE=1
export ANSIBLE_NOCOWS=1
export LANG="de_DE.UTF-8"
export LC_MESSAGES="C"
if [ -f /usr/local/bin/nvim ]
then
    export EDITOR=/usr/local/bin/nvim
fi


export PATH=$PATH:/usr/sbin:/usr/local/sbin:/usr/local/heroku/bin
export PATH=$PATH:~/local/bin:~/.local/bin
export PATH=$PATH:~/.poetry/bin


if [ -f /usr/local/bin/virtualenvwrapper.sh ]
then
    source /usr/local/bin/virtualenvwrapper.sh
elif [ -f /usr/bin/virtualenvwrapper.sh ]
then
    source /usr/bin/virtualenvwrapper.sh
elif [ -f /usr/share/virtualenvwrapper/virtualenvwrapper.sh ]
then
    source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
fi
export WORKON_HOME=~/.virtualenvs



HOSTNAME=$(uname -n)
keychain ~/.ssh/id_rsa
if [ -e ~/.keychain/$HOSTNAME-sh ]
then
    . ~/.keychain/$HOSTNAME-sh
fi
if [ -e ~/.keychain/$HOSTNAME-gpg ]
then
    . ~/.keychain/$HOSTNAME-sh-gpg
fi


export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if [ -e "$HOME/.pyenv" ]
then
    eval "$(pyenv init -)"
fi

source ~/dotfiles/zsh-dircolors-solarized/zsh-dircolors-solarized.zsh

setxkbmap -layout us -option compose:rwin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

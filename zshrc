setopt pushd_ignore_dups

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt appendhistory
setopt inc_append_history
setopt share_history
setopt extended_history

autoload -Uz compinit
compinit
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' menu select

setopt extendedglob nomatch

setopt beep notify

WORDCHARS=${WORDCHARS//[\/.-]}

bindkey -e

alias ls='ls -h --color=auto --group-directories-first'
alias ll="ls -l"
alias la="ls -a"
alias lla="ls -la"

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

export PATH=$PATH:/usr/sbin:/usr/local/sbin:/usr/local/heroku/bin
export PATH=$PATH:~/local/bin

# ~/local/bin must be in PATH for this to work.
if [ -x ~/local/bin/direnv ]
then
    eval "$(~/local/bin/direnv hook zsh)"
fi

export HGENCODING="utf-8"
export PYTHONSTARTUP=~/.pystartup
export ANSIBLE_NOCOWS=1
export LANG="de_DE.UTF-8"
export LC_MESSAGES="C"

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

if [ -f /usr/local/bin/nvim ]
then
    export EDITOR=/usr/local/bin/nvim
fi

PROMPT="%n@%m %1~ %# "

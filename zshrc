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

if [[ -o login ]]
then
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
fi

export PATH=$PATH:/usr/sbin:/usr/local/sbin:/usr/local/heroku/bin
export PATH=$PATH:~/local/bin:~/.local/bin
export PATH=$PATH:~/.poetry/bin

# ~/local/bin must be in PATH for this to work.
if [ -x ~/local/bin/direnv ]
then
    eval "$(~/local/bin/direnv hook zsh)"
fi

export HGENCODING="utf-8"
export PYTHONSTARTUP=~/.pystartup
export PYTHONDONTWRITEBYTECODE=1
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



setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
    '%F{5}[%F{2}%b%F{5}] (%a) %f '
zstyle ':vcs_info:*' formats       \
    '%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

zstyle ':vcs_info:*' enable git


# or use pre_cmd, see man zshcontrib
vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}


PROMPT="%n@%m %1~ %# "$'$(vcs_info_wrapper)'
if [[ -n "$VIRTUAL_ENV" ]]; then
    PS1="($(basename "$VIRTUAL_ENV")) $PS1"
fi

_direnv_hook() {
  eval "$(direnv export zsh)";
}
typeset -ag precmd_functions
if [[ -z $precmd_functions[(r)_direnv_hook] ]]; then
  precmd_functions+=_direnv_hook;
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

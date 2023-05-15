# vim: set syntax=zsh:

setopt autopushd
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


bindkey -e


alias ls='ls -h --color=auto --group-directories-first'
alias ll="ls -l"
alias la="ls -a"
alias lla="ls -la"
#
#
if type direnv > /dev/null
then
    eval "$(direnv hook zsh)"
fi


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


[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.poetry/bin:$PATH"
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
#
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/rene/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/home/rene/Downloads/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/home/rene/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/rene/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

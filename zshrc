# vim: set syntax=zsh:

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
# ~/local/bin must be in PATH for this to work.
if [ -x ~/local/bin/direnv ]
then
    eval "$(~/local/bin/direnv hook zsh)"
fi



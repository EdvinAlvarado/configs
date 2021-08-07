# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/edvin/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


# User set config
PROMPT='[%F{red}%n%f@%m %F{blue}%~%f] %(?.%F{green}√%f.%F{red}?%?%f) %(!.%F{red}!%f.>) '
RPROMPT='%*'
alias ls='ls --color=auto'
alias lsa='ls -a'
# alias vpn='cyberghostvpn --connect --country-code'
export PATH="$HOME/bin/:$PATH"

autoload -Uz promptinit
promptinit

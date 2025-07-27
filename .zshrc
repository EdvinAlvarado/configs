# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git tmux aliases colored-man-pages colorize command-not-found dircycle extract history vi-mode cabal docker gitignore golang python archlinux systemd themes fzf eza)
## command-not-found not working

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#PROMPT='[%F{red}%n%f@%m %F{blue}%~%f] %(?.%F{green}√%f.%F{red}?%?%f) %(!.%F{red}!%f.>) '
MODE_INDICATOR='%F{red}<<<%f %*'
INSERT_MODE_INDICATOR='%*'

bindkey -v
#alias ls='ls --color=auto'
alias tmux="tmux -2" #force tmux to assume terminal supports 256 colors
alias fzf="fzf --tmux"
alias nvimf="nvim \$(fzf)"
alias cat="bat"
# alias vpn='cyberghostvpn --connect --country-code'
export PATH="$HOME/.local/bin/:$HOME/bin/:$HOME/.ghcup/bin:$HOME/.cabal/bin:$PATH:$GOPATH/bin:$HOME/go/bin:$HOME/.cargo/bin"
export EDITOR=nvim
export VISUAL=nvim
export MANPAGER='nvim +Man!'
export XDG_CONFIG_HOME=~/.config
source <(fzf --zsh)
# eza
zstyle ':omz:plugins:eza' 'dirs-first' yes
zstyle ':omz:plugins:eza' 'git-status' yes
zstyle ':omz:plugins:eza' 'icons' yes

# uutils

alias \[="uu-["
alias arch="uu-arch"
alias base32="uu-base32"
alias base64="uu-base64"
alias basename="uu-basename"
alias basenc="uu-basenc"
alias cat="uu-cat"
alias chgrp="uu-chgrp"
alias chmod="uu-chmod"
alias chown="uu-chown"
alias chroot="uu-chroot"
alias cksum="uu-cksum"
alias comm="uu-comm"
alias coreutils="uu-coreutils"
alias cp="uu-cp"
alias csplit="uu-csplit"
alias cut="uu-cut"
alias date="uu-date"
alias dd="uu-dd"
alias df="uu-df"
alias dir="uu-dir"
alias dircolors="uu-dircolors"
alias dirname="uu-dirname"
alias du="uu-du"
alias echo="uu-echo"
alias env="uu-env"
alias expand="uu-expand"
alias expr="uu-expr"
alias factor="uu-factor"
alias false="uu-false"
alias fmt="uu-fmt"
alias fold="uu-fold"
alias groups="uu-groups"
alias hashsum="uu-hashsum"
alias head="uu-head"
alias hostid="uu-hostid"
alias hostname="uu-hostname"
alias id="uu-id"
alias install="uu-install"
alias join="uu-join"
alias kill="uu-kill"
alias link="uu-link"
alias ln="uu-ln"
alias logname="uu-logname"
alias ls="uu-ls"
alias mkdir="uu-mkdir"
alias mkfifo="uu-mkfifo"
alias mknod="uu-mknod"
alias mktemp="uu-mktemp"
alias more="uu-more"
alias mv="uu-mv"
alias nice="uu-nice"
alias nl="uu-nl"
alias nohup="uu-nohup"
alias nproc="uu-nproc"
alias numfmt="uu-numfmt"
alias od="uu-od"
alias paste="uu-paste"
alias pathchk="uu-pathchk"
alias pinky="uu-pinky"
alias pr="uu-pr"
alias printenv="uu-printenv"
alias printf="uu-printf"
alias ptx="uu-ptx"
alias pwd="uu-pwd"
alias readlink="uu-readlink"
alias realpath="uu-realpath"
alias rm="uu-rm"
alias rmdir="uu-rmdir"
alias seq="uu-seq"
alias shred="uu-shred"
alias shuf="uu-shuf"
alias sleep="uu-sleep"
alias sort="uu-sort"
alias split="uu-split"
alias stat="uu-stat"
alias stdbuf="uu-stdbuf"
alias sum="uu-sum"
alias sync="uu-sync"
alias tac="uu-tac"
alias tail="uu-tail"
alias tee="uu-tee"
alias test="uu-test"
alias timeout="uu-timeout"
alias touch="uu-touch"
alias tr="uu-tr"
alias true="uu-true"
alias truncate="uu-truncate"
alias tsort="uu-tsort"
alias tty="uu-tty"
alias uname="uu-uname"
alias unexpand="uu-unexpand"
alias uniq="uu-uniq"
alias unlink="uu-unlink"
alias uptime="uu-uptime"
alias users="uu-users"
alias vdir="uu-vdir"
alias wc="uu-wc"
alias who="uu-who"
alias whoami="uu-whoami"
alias yes="uu-yes"



autoload -Uz promptinit
promptinit

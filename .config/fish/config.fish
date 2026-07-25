# Fish config translated from .zshrc

# --- Environment variables ---
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx MANPAGER 'nvim +Man!'
set -gx OLLAMA_HOST "http://127.0.0.1:11434"
set -gx OLLAMA_CONTEXT_LENGTH 40000

# --- PATH ---
fish_add_path $HOME/.local/bin $HOME/.bin $HOME/.ghcup/bin $HOME/.cabal/bin $GOPATH/bin $HOME/go/bin $HOME/.cargo/bin

# --- Vi mode ---
fish_vi_key_bindings

# --- Prompt / theme ---
# Fish doesn't use oh-my-zsh themes. Pick a built-in (e.g. `fish_config`) or install a prompt like Starship/Tide.
# The zsh prompt you had:
#   PROMPT='[%F{red}%n%f@%m %F{blue}%~%f] %(?.%F{green}√%f.%F{red}?%?%f) %(!.%F{red}!%f.>) '
#   MODE_INDICATOR='%F{red}<<<%f %*'
#   INSERT_MODE_INDICATOR='%*'
# can be recreated in a custom prompt function if desired.

# --- fzf ---
fzf --fish | source

# --- zoxide (replaces cd) ---
zoxide init fish --cmd cd | source

# --- starship prompt ---
starship init fish | source

# --- API keys ---
source "$HOME/.api_keys.env"

# --- Aliases ---
alias nvimf='nvim (fzf)'
alias cat='bat'
alias rename='perl-rename'

# uutils coreutils aliases
#alias \[="uu-["
alias arch='uu-arch'
alias base32='uu-base32'
alias base64='uu-base64'
alias basename='uu-basename'
alias basenc='uu-basenc'
#alias cat="uu-cat"
alias chgrp='uu-chgrp'
alias chmod='uu-chmod'
alias chown='uu-chown'
alias chroot='uu-chroot'
alias cksum='uu-cksum'
alias comm='uu-comm'
alias coreutils='uu-coreutils'
alias cp='uu-cp'
alias csplit='uu-csplit'
alias cut='uu-cut'
alias date='uu-date'
alias dd='uu-dd'
alias df='uu-df'
alias dir='uu-dir'
alias dircolors='uu-dircolors'
alias dirname='uu-dirname'
alias du='uu-du'
alias echo='uu-echo'
alias env='uu-env'
alias expand='uu-expand'
alias expr='uu-expr'
alias factor='uu-factor'
alias false='uu-false'
alias fmt='uu-fmt'
alias fold='uu-fold'
alias groups='uu-groups'
alias hashsum='uu-hashsum'
alias head='uu-head'
alias hostid='uu-hostid'
alias hostname='uu-hostname'
alias id='uu-id'
alias install='uu-install'
alias join='uu-join'
alias kill='uu-kill'
alias link='uu-link'
alias ln='uu-ln'
alias logname='uu-logname'
#alias ls="uu-ls"
alias mkdir='uu-mkdir'
alias mkfifo='uu-mkfifo'
alias mknod='uu-mknod'
alias mktemp='uu-mktemp'
alias more='uu-more'
alias mv='uu-mv'
alias nice='uu-nice'
alias nl='uu-nl'
alias nohup='uu-nohup'
alias nproc='uu-nproc'
alias numfmt='uu-numfmt'
alias od='uu-od'
alias paste='uu-paste'
alias pathchk='uu-pathchk'
alias pinky='uu-pinky'
alias pr='uu-pr'
alias printenv='uu-printenv'
alias printf='uu-printf'
alias ptx='uu-ptx'
alias pwd='uu-pwd'
alias readlink='uu-readlink'
alias realpath='uu-realpath'
alias rm='uu-rm'
alias rmdir='uu-rmdir'
alias seq='uu-seq'
alias shred='uu-shred'
alias shuf='uu-shuf'
alias sleep='uu-sleep'
alias sort='uu-sort'
alias split='uu-split'
alias stat='uu-stat'
alias stdbuf='uu-stdbuf'
alias sum='uu-sum'
alias sync='uu-sync'
alias tac='uu-tac'
alias tail='uu-tail'
alias tee='uu-tee'
#alias test='uu-test'
alias timeout='uu-timeout'
alias touch='uu-touch'
alias tr='uu-tr'
alias true='uu-true'
alias truncate='uu-truncate'
alias tsort='uu-tsort'
alias tty='uu-tty'
alias uname='uu-uname'
alias unexpand='uu-unexpand'
alias uniq='uu-uniq'
alias unlink='uu-unlink'
alias uptime='uu-uptime'
alias users='uu-users'
alias vdir='uu-vdir'
alias wc='uu-wc'
alias who='uu-who'
alias whoami='uu-whoami'
alias yes='uu-yes'

# --- Yazi cwd changer ---
function y
    set -l tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    set -l cwd (command cat "$tmp")
    if test -n "$cwd"; and test "$cwd" != "$PWD"
        cd -- "$cwd"
    end
    rm -f -- "$tmp"
end


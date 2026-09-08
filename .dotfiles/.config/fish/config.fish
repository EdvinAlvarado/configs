# Fish config translated from .zshrc

# --- Environment variables ---
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx MANPAGER 'nvim +Man!'
set -gx OLLAMA_HOST "http://127.0.0.1:11434"
set -gx OLLAMA_CONTEXT_LENGTH 40000
set -gx YAZI_ADAPTER kitty

# Guix environment variables
set -gx GUIX_LOCPATH "$HOME/.guix-profile/lib/locale"
set -gx GUIX_PROFILE "$HOME/.guix-profile"
set -gx XDG_DATA_DIRS $XDG_DATA_DIRS $HOME/.guix-profile/share

# Make Flatpak apps available immediately
# This seems to be default in Arch linux and but not other distros, so we add it here to be safe
set -gx XDG_DATA_DIRS $XDG_DATA_DIRS /var/lib/flatpak/exports/share
set -gx XDG_DATA_DIRS $XDG_DATA_DIRS $HOME/.local/share/flatpak/exports/share

# --- PATH ---
fish_add_path $HOME/.local/bin $HOME/.bin $HOME/.ghcup/bin $HOME/.cabal/bin $GOPATH/bin $HOME/go/bin $HOME/.cargo/bin $HOME/.config/emacs/bin  $HOME/.guix-profile/bin

# --- Vi mode ---
fish_vi_key_bindings

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
alias ls='eza'
alias magit='emacs -nw -e "magit-status"'
alias makemkv_fix='LD_LIBRARY_PATH=/opt/ffmpeg8/lib makemkv'

# uutils coreutils aliases
set -l uu_prefix uu
if test -f /etc/os-release
    if string match -q -r '^ID=nixos$' < /etc/os-release
        set uu_prefix uutils
    end
end

#alias \[="$uu_prefix-["
alias arch="$uu_prefix-arch"
alias base32="$uu_prefix-base32"
alias base64="$uu_prefix-base64"
alias basename="$uu_prefix-basename"
alias basenc="$uu_prefix-basenc"
#alias cat="$uu_prefix-cat"
alias chgrp="$uu_prefix-chgrp"
alias chmod="$uu_prefix-chmod"
alias chown="$uu_prefix-chown"
alias chroot="$uu_prefix-chroot"
alias cksum="$uu_prefix-cksum"
alias comm="$uu_prefix-comm"
alias coreutils="$uu_prefix-coreutils"
alias cp="$uu_prefix-cp"
alias csplit="$uu_prefix-csplit"
alias cut="$uu_prefix-cut"
alias date="$uu_prefix-date"
alias dd="$uu_prefix-dd"
alias df="$uu_prefix-df"
alias dir="$uu_prefix-dir"
alias dircolors="$uu_prefix-dircolors"
alias dirname="$uu_prefix-dirname"
alias du="$uu_prefix-du"
alias echo="$uu_prefix-echo"
alias env="$uu_prefix-env"
alias expand="$uu_prefix-expand"
alias expr="$uu_prefix-expr"
alias factor="$uu_prefix-factor"
alias false="$uu_prefix-false"
alias fmt="$uu_prefix-fmt"
alias fold="$uu_prefix-fold"
alias groups="$uu_prefix-groups"
alias hashsum="$uu_prefix-hashsum"
alias head="$uu_prefix-head"
alias hostid="$uu_prefix-hostid"
alias hostname="$uu_prefix-hostname"
alias id="$uu_prefix-id"
alias install="$uu_prefix-install"
alias join="$uu_prefix-join"
alias kill="$uu_prefix-kill"
alias link="$uu_prefix-link"
alias ln="$uu_prefix-ln"
alias logname="$uu_prefix-logname"
#alias ls="$uu_prefix-ls"
alias mkdir="$uu_prefix-mkdir"
alias mkfifo="$uu_prefix-mkfifo"
alias mknod="$uu_prefix-mknod"
alias mktemp="$uu_prefix-mktemp"
alias more="$uu_prefix-more"
alias mv="$uu_prefix-mv"
alias nice="$uu_prefix-nice"
alias nl="$uu_prefix-nl"
alias nohup="$uu_prefix-nohup"
alias nproc="$uu_prefix-nproc"
alias numfmt="$uu_prefix-numfmt"
alias od="$uu_prefix-od"
alias paste="$uu_prefix-paste"
alias pathchk="$uu_prefix-pathchk"
alias pinky="$uu_prefix-pinky"
alias pr="$uu_prefix-pr"
alias printenv="$uu_prefix-printenv"
alias printf="$uu_prefix-printf"
alias ptx="$uu_prefix-ptx"
alias pwd="$uu_prefix-pwd"
alias readlink="$uu_prefix-readlink"
alias realpath="$uu_prefix-realpath"
alias rm="$uu_prefix-rm"
alias rmdir="$uu_prefix-rmdir"
alias seq="$uu_prefix-seq"
alias shred="$uu_prefix-shred"
alias shuf="$uu_prefix-shuf"
alias sleep="$uu_prefix-sleep"
alias sort="$uu_prefix-sort"
alias split="$uu_prefix-split"
alias stat="$uu_prefix-stat"
alias stdbuf="$uu_prefix-stdbuf"
alias sum="$uu_prefix-sum"
alias sync="$uu_prefix-sync"
alias tac="$uu_prefix-tac"
alias tail="$uu_prefix-tail"
alias tee="$uu_prefix-tee"
#alias test="$uu_prefix-test"
alias timeout="$uu_prefix-timeout"
alias touch="$uu_prefix-touch"
alias tr="$uu_prefix-tr"
alias true="$uu_prefix-true"
alias truncate="$uu_prefix-truncate"
alias tsort="$uu_prefix-tsort"
alias tty="$uu_prefix-tty"
alias uname="$uu_prefix-uname"
alias unexpand="$uu_prefix-unexpand"
alias uniq="$uu_prefix-uniq"
alias unlink="$uu_prefix-unlink"
alias uptime="$uu_prefix-uptime"
alias users="$uu_prefix-users"
alias vdir="$uu_prefix-vdir"
alias wc="$uu_prefix-wc"
alias who="$uu_prefix-who"
alias whoami="$uu_prefix-whoami"
alias yes="$uu_prefix-yes"

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


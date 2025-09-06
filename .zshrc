export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="afowler"

source $ZSH/oh-my-zsh.sh

source ~/.alias

# Emacs
alias emacs="emacs -nw --init-directory=~/.emacs.d/"
source ~/.emacs.d/init.sh

# hstr
alias hh=hstr
setopt histignorespace
export HSTR_CONFIG=hicolor
hstr_no_tiocsti() {
    zle -I
    { HSTR_OUT="$({ </dev/tty hstr ${BUFFER}; } 2>&1 1>&3 3>&-)"; } 3>&1
    BUFFER="${HSTR_OUT}"
    CURSOR=${#BUFFER}
    zle redisplay
}
zle -N hstr_no_tiocsti
bindkey '\C-r' hstr_no_tiocsti
export HSTR_TIOCSTI=n

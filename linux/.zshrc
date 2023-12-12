autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '
setopt PROMPT_SUBST
PROMPT='%F{green}%~%f %F{red}${vcs_info_msg_0_}%f%F{blue}'$'\Ue691%f '
. "$HOME/.cargo/env"
export PATH=$PATH:/usr/local/go/bin
export PATH=$HOME/bin:/usr/local/bin:$PATH
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8
alias vi="nvim"
alias vim="nvim"
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

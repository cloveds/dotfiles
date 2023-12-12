ZSH_THEME=robbyrussell
. "$HOME/.cargo/env"
export PATH=$PATH:/usr/local/go/bin
export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
plugins=(git)
source $ZSH/oh-my-zsh.sh
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8
alias vi="nvim"
alias vim="nvim"
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE

setopt hist_ignore_all_dups # Remove older duplicate entries from history
setopt hist_reduce_blanks # Remove superfluous blanks from history items
setopt inc_append_history # Save history entries as soon as they are entered
setopt share_history # Share history between different instances of the shell

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

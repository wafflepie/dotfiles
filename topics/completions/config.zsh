autoload -Uz compinit

typeset -i updated_at=$(
  date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null
)

if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi

zmodload -i zsh/complist

setopt auto_list # Automatically list choices on ambiguous completion
setopt auto_menu # Automatically use menu completion
setopt always_to_end # Move cursor to end if word had one match

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # Matches case insensitive for lowercase
zstyle ':completion:*' insert-tab pending # Pasting with tabs doesn't perform completion
zstyle ':completion:*' menu select

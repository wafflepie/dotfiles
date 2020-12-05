if is_wsl; then
  alias ls='ls --color=auto'
fi

if is_mac; then
  alias ls='gls --color=auto'
fi

alias l='ls -lh'
alias la='ls -lAh'

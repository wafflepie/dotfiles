if is_wsl; then
  eval $(dircolors -b $HOME/.dircolors)
fi

if is_mac; then
  eval $(gdircolors -b $HOME/.dircolors)
fi

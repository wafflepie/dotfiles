if is_wsl; then
  eval $(dircolors -b $HOME/.dircolors)
fi

if is_macos; then
  eval $(gdircolors -b $HOME/.dircolors)
fi

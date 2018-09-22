FISH=/usr/local/bin/fish

if ! grep -q "$FISH" /etc/shells; then
  echo "$FISH" | sudo tee -a /etc/shells
fi

if ! [[ "$SHELL" -ef "$FISH" ]]; then
  chsh -s "$FISH"
fi

if [[ -z "$OMF_CONFIG" ]]; then
  curl -L https://get.oh-my.fish | fish
fi

fish -c "omf doctor; omf update; omf install"

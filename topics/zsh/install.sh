ZSH_PATH=$(which zsh)

if ! grep -q "$ZSH_PATH" /etc/shells; then
  echo "$ZSH_PATH" | sudo tee -a /etc/shells
fi

if ! [[ "$SHELL" -ef "$ZSH_PATH" ]]; then
  chsh -s "$ZSH_PATH"
fi

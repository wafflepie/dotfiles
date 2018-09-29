zsh_path="$(which zsh)"

if ! grep -q "$zsh_path" /etc/shells; then
  echo "$zsh_path" | sudo tee -a /etc/shells
fi

if ! [[ "$SHELL" -ef "$zsh_path" ]]; then
  chsh -s "$zsh_path"
fi

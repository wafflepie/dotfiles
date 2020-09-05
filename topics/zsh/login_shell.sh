zsh_path="$(which zsh)"

if ! grep -q "$zsh_path" /etc/shells; then
  echo "$zsh_path" | sudo tee -a /etc/shells
fi

if ! [[ "$SHELL" -ef "$zsh_path" ]]; then
  if command -v chsh > /dev/null; then
    chsh -s "$zsh_path"
  else
    sudo lchsh -i "$(whoami)"
  fi
fi

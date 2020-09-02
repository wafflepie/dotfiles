zsh_path="$(which zsh)"

if ! grep -q "$zsh_path" /etc/shells; then
  echo "$zsh_path" | sudo tee -a /etc/shells
fi

if ! [[ "$SHELL" -ef "$zsh_path" ]]; then
  if is_wsl; then
    sudo lchsh -i "$(whoami)"
  else
    chsh -s "$zsh_path"
  fi
fi

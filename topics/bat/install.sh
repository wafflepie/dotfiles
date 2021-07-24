if is_ubuntu; then
  sudo apt install bat
  mkdir -p ~/.local/bin

  TARGET_PATH=~/.local/bin/bat

  if [[ ! -f "$TARGET_PATH" ]]; then
    ln -s /usr/bin/batcat "$TARGET_PATH"
  fi
fi

if is_fedora; then
  sudo dnf install bat
fi

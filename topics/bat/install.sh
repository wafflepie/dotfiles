if is_ubuntu; then
  sudo apt install bat
  mkdir -p ~/.local/bin
  ln -s /usr/bin/batcat ~/.local/bin/bat
fi

if is_fedora; then
  sudo dnf install bat
fi

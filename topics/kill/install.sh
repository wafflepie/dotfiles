if is_ubuntu; then
  sudo apt install lsof
fi

if is_fedora; then
  sudo dnf install lsof
fi

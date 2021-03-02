if ! is_wsl && is_fedora; then
  sudo dnf install inkscape xcursorgen
  sudo dnf copr enable peterwu/rendezvous
  sudo dnf install bibata-cursor-themes
fi
